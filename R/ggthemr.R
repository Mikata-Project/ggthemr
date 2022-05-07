#' @title Set theme for ggplot2
#' @description Set theme to be applied to all subsequent ggplots.
#' @param palette Colour scheme by name or ggtheme object.
#' @param layout The layout of gridlines, axes etc.
#' @param spacing A numeric value of how much space should exist on any given plot. Low values will result in more cramped plots, higher values will have more whitespace.
#' @param text_size base text size.
#' @param type Set to 'inner' where the background colour should not extend past strictly the plot area (or 'panel' in ggplot2 terminology). 'outer' will apply the background colour to the entire plot.
#' @param line_weight The thickness of axes lines and gridlines. Useful for saving plots at different resolutions.
#' @param set_theme If TRUE (default), the default theme, geoms and scales are updated.
#' @importFrom ggplot2 discrete_scale continuous_scale
#' @importFrom scales seq_gradient_pal
#' @return Returns a list with a ggplot2 theme object, aesthetic parameters for geoms, scale functions and input parameters
#' @export
#' @author Ciaran Tobin
#' @examples 
#'  ggthemr('pale', layout = 'scientific', spacing = 2, type = 'inner')
ggthemr <- function(palette     = 'dust',
                    layout      = 'clear', 
                    spacing     = 1,
                    text_size   = 12,
                    type        = 'inner', 
                    line_weight = 0.5,
                    set_theme   = TRUE) {
  
  palette <- load_palette(palette)
  layout  <- load_layout(layout)
  
  if (spacing < 0)
    stop('Spacing factor must be positive.', call. = FALSE)
  
  this_theme  <- get_theme(palette, layout, spacing, text_size, type, line_weight)
  this_geoms  <- theme_geoms(palette, line_weight)
  
  themr <- structure(list(
    theme         = this_theme,
    geom_defaults = this_geoms,
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
  for (one_geom_defaults in this_geoms$new) do.call(what = update_geom_defaults, args = one_geom_defaults)
  
  # setting the scales
  colours <- palette$swatch[-1]
  options('ggplot2.discrete.fill' = function(...) discrete_scale('fill', 'ggthemr', discrete_colours(colours), ...))
  options('ggplot2.discrete.colour' = function(...) discrete_scale('colour', 'ggthemr', discrete_colours(colours), ...))

  options('ggplot2.ordinal.fill' = function(...) discrete_scale('fill', 'ggthemr', discrete_colours(colours), ...))
  options('ggplot2.ordinal.colour' = function(...) discrete_scale('colour', 'ggthemr', discrete_colours(colours), ...))

                                                                     
  
  options('ggplot2.continuous.fill' = function(...) continuous_scale('fill', 'ggthemr',

seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']], 'Lab'),
                                                                     guide = 'colourbar', ...))
  options('ggplot2.continuous.colour' = function(...) continuous_scale('colour', 'ggthemr',
                                                                      seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']], 'Lab'),
                                                                      guide = 'colourbar', ...))

  # saving the inputs for future reference
  set_themr(themr)
  
}
