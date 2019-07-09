#' @title Set theme for ggplot2
#' @description Set theme to be applied to all subsequent ggplots.
#' @param palette Colour scheme by name or ggtheme object.
#' @param layout The layout of gridlines, axes etc.
#' @param spacing A numeric value of how much space should exist on any given plot. Low values will result in more cramped plots, higher values will have more whitespace.
#' @param text_size base text size.
#' @param type Set to 'inner' where the background colour should not extend past strictly the plot area (or "panel" in ggplot2 terminology). 'outer' will apply the background colour to the entire plot.
#' @param line_weight The thickness of axes lines and gridlines. Useful for saving plots at different resolutions.
#' @param pos Where the new scales are stored.
#' @param envir The environment where the new scales are stored.
#' @param set_theme If TRUE (default), the default theme, geoms and scales are updated.
#' @return Returns a list with a ggplot2 theme object, aesthetic parameters for geoms, scale functions and input parameters
#' @export
#' @author Ciaran Tobin
#' @examples 
#'  ggthemr('pale', layout = 'scientific', spacing = 2, type = 'inner')
ggthemr <- function(palette      = 'dust',
                    layout       = 'clear', 
                    spacing      = 1,
                    text_size    = 12,
                    type         = 'inner', 
                    line_weight  = 0.5,
                    pos          = 1,
                    envir        = as.environment(pos),
                    set_theme    = TRUE,
                    geom_updates = list()) {
  
  palette <- load_palette(palette)
  layout  <- load_layout(layout)
  
  if (spacing < 0)
    stop('Spacing factor must be positive.', call. = FALSE)
  
  this_theme  <- get_theme(palette, layout, spacing, text_size, type, line_weight)
  this_geoms  <- theme_geoms(palette, line_weight)
  this_scales <- theme_scales(palette)
  
  themr <- structure(list(
    theme         = this_theme,
    geom_defaults = this_geoms,
    scales        = this_scales,
    palette       = palette,
    layout        = layout,
    text_size     = text_size,
    spacing       = spacing,
    type          = type
  ), class = 'ggthemr')
  
  if (!set_theme) return(themr) 
  
  # setting the theme
  theme_set(this_theme)
  
  # setting the geoms
  for (one_geom_defaults in this_geoms$new) {
    geom_name <- sprintf("geom_%s", one_geom_defaults$geom)
    geom_f    <- getExportedValue("ggplot2", geom_name)
    
    # add modified arguments to geom_updates for modifying ggplot function calls
    if (geom_name %in% names(geom_updates)) {
      updated_defaults <- geom_updates[[geom_name]]
      
      # modify formal argument defaults by masking in environment
      update_is_fml <- names(updated_defaults) %in% names(formals(geom_f))
      updated_fmls <- updated_defaults[which(update_is_fml)]
      formals(geom_f)[names(updated_fmls)] <- updated_fmls
      assign(geom_name, geom_f, envir = envir)
      
      # modify default aesthetics with update_geom_defaults
      updated_aes <- updated_defaults[which(!update_is_fml)]
      one_geom_defaults$new[names(updated_aes)] <- updated_aes
      
    } else if (exists(geom_name, envir = envir)) {
      suppressWarnings(remove(list = geom_name, envir = envir))
    }
    
    do.call(what = update_geom_defaults, args = one_geom_defaults)
  }
  
  # setting the scales
  Map(function(name, f) assign(name, f, envir = envir),
    names(this_scales),
    this_scales)
  
  # saving the inputs for future reference
  set_themr(themr)
  
}
