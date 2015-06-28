#'  Set theme for ggplot2
#'  
#'  Set theme to be applied to all subsequent ggplots.
#'  
#'  @param palette Colour scheme by name or ggtheme object.
#'  @param layout The layout of gridlines, axes etc.
#'  @param spacing A numeric value of how much space should exist on any given plot. Low values will result in more cramped plots, higher values will have more whitespace.
#'  @param text_size base text size.
#'  @param type Set to 'inner' where the background colour should not extend past strictly the plot area (or "panel" in ggplot2 terminology). 'outer' will apply the background colour to the entire plot.
#'  @param line_weight The thickness of axes lines and gridlines. Useful for saving plots at different resolutions.
#'  @param pos Where the new scales are stored.
#'  @param envir The environment where the new scales are stored.
#'  @export
#'  @author Ciaran Tobin
#'  @examples 
#'  ggthemr('pale', layout = 'scientific', spacing = 2, type = 'inner')

ggthemr <- function(palette = 'dust', layout = 'clear', 
                    spacing = 1.6, text_size = 12, type = 'inner', 
                    line_weight = 0.5, pos = 1, envir = as.environment(pos)) {
  
  palette <- load_palette(palette)
  layout <- load_layout(layout)
    
  if (spacing < 0)
    stop('Spacing factor must be positive.', call. = FALSE)

  set_theme(palette, layout, spacing, text_size, type, line_weight)
  theme_scales(palette, line_weight, pos, envir)
  
  themr <- structure(list(
    palette = palette,
    layout = layout,
    text_size = text_size,
    spacing = spacing,
    type = type
  ), class = 'ggthemr')
  
  set_themr(themr)
  
}
