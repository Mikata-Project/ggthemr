#'  Set theme for ggplot2
#'  
#'  Set theme to be applied to all subsequent ggplots.
#'  
#'  @param palette Colour scheme by name or ggtheme object.
#'  @param layout The layout of gridlines, axes etc.
#'  @param spacing A numeric value of how much space should exist on any given plot. Low values will result in more cramped plots, higher values will have more whitespace.
#'  @param text_size base text size.
#'  @param type Set to 'inner' where the background colour should not extend past strictly the plot area (or "panel" in ggplot2 terminology). 'outer' will apply the background colour to the entire plot.
#'  @param static TRUE will return the colour palette used. This may be useful if changes are desired where the plot colours are needed. FALSE will only set the theme but not return it.
#'  @export
#'  @author Ciaran Tobin
#'  @examples 
#'  ggthemr('pale', layout = 'scientific', spacing = 2, type = 'inner')

ggthemr <- function(palette = 'dust', layout = 'clear', spacing = 1.6, text_size = 12, type = 'inner', line_weight = 0.5, static = TRUE) {
  
  palette_name <- ifelse(is.character(palette), palette, 'custom')
  layout_name <- ifelse(is.character(layout), layout, 'custom')
  
  palette <- load_palette(palette)
  layout <- load_layout(layout)
  text_colour <- palette$text[[match.arg(type, names(palette$text))]]
  
  if (spacing < 0)
    stop('Spacing factor must be positive.')
  
  # Functions to define axes title distances' from axis (with sensible minimum/maximum values).
  x_title_spacing <- function(spacing) max(-1.2, -(spacing/1.25) + 0.5)
  y_title_spacing <- function(spacing) min(0.4, max(-0.2, 1 - (spacing/1.25) + 0.2))  
  
  inner <- type == 'inner'
  
  line_colour <- ifelse(inner, palette$line[['inner']], palette$line[['outer']])
  
  ggplot2::theme_set(theme(
    line = element_line(
      colour = line_colour, 
      size = line_weight, 
      linetype = 1, 
      lineend = "butt"),   
    rect = element_rect(
      fill = "white", 
      colour = text_colour, 
      size = 0.5, 
      linetype = 1), 
    text = element_text(
      family = '', 
      face = "plain", 
      colour = text_colour, 
      size = text_size, 
      hjust = 0.5, 
      vjust = 0.5, 
      angle = 0, 
      lineheight = 0.9), 
    axis.text = element_text(
      size = rel(0.8), 
      colour = text_colour), 
    strip.text = element_text(
      size = rel(0.8)), 
    axis.line = element_line(
      colour = line_colour),
    axis.line.x = layout$axis.line.x(colour = line_colour),
    axis.line.y = layout$axis.line.y(colour = line_colour),
    axis.text.x = element_text(
      vjust = 1, 
      colour = text_colour, 
      face='bold'), 
    axis.text.y = element_text(
      hjust = 1, 
      colour = text_colour, 
      face='bold'), 
    axis.ticks = layout$axis.ticks(colour = line_colour),
    axis.title = layout$axis.title(colour = text_colour),
    axis.title.x = element_text(
      vjust=x_title_spacing(spacing)), 
    axis.title.y = element_text(
      angle = 90, 
      vjust=y_title_spacing(spacing)), 
    axis.ticks.length = grid::unit(0.15, "cm"), 
    axis.ticks.margin = grid::unit(0.1 * spacing, 'cm'), 
    legend.background = element_rect(
      colour = ifelse(inner, 'white', palette$background),
      fill = ifelse(inner, 'white', palette$background)), 
    legend.margin = grid::unit(0.2 * spacing, "cm"), 
    legend.key = element_rect(
      colour = ifelse(inner, 'white', palette$background),
      fill = palette$background), 
    legend.key.size = grid::unit(
      1.2, "lines"), 
    legend.key.height = NULL,
    legend.key.width = NULL, 
    legend.text = element_text(
      size = rel(0.8)), 
    legend.text.align = NULL, 
    legend.title = element_text(
      size = rel(0.8), 
      face = "bold", 
      hjust = 0), 
    legend.title.align = NULL, 
    legend.position = "right", 
    legend.direction = NULL, 
    legend.justification = "center", 
    legend.box = NULL, 
    panel.background = element_rect(
      fill = palette$background, 
      colour = NA), 
    panel.border = element_blank(), 
    panel.grid.major = layout$panel.grid.major(colour = palette$gridline), 
    panel.grid.minor = layout$panel.grid.minor(colour = palette$gridline), 
    panel.margin = grid::unit(0.5 * spacing, 'cm'), 
    strip.background = element_rect(
      fill = ifelse(inner, 'white', palette$background), 
      colour = NA), 
    strip.text = layout$strip.text(colour=text_colour),
    strip.text.x = element_text(
      size = rel(1.1), 
      face = 'bold'), 
    strip.text.y = element_text(
      angle = -90,
      face = 'bold',
      size = rel(1.1)), 
    plot.background = element_rect(
      colour = ifelse(inner, 'white', palette$background),
      fill = ifelse(inner, 'white', palette$background)), 
    plot.title = element_text(
      size = rel(1.2), 
      vjust = spacing + 0.2, 
      face='bold'), 
    plot.margin = grid::unit(c(0.625, 0.625, 0.625, 0.625) * spacing, 'cm'), 
    complete = TRUE
  ))
  
  theme_scales(palette, line_weight)
  
  if (static) {
    invisible() 
  } else {
    #getRefClass('ggthemr')$new(palette_name, layout_name, palette, layout, spacing, text_size, type)  
    
    themr <- list(
      palette = list(
          name = palette_name,
          object = palette
        ),
      layout = list(
          name = layout_name,
          object = layout
        ),
      text_size = text_size,
      spacing = spacing,
      type = type
    )
    
    class(themr) <- 'ggthemr'
    return (themr)

  }
  
}


# Add line thickness.
