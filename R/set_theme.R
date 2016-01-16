set_theme <- function (palette, layout, spacing, text_size, type, line_weight) {
  
  inner <- type == 'inner'
  text_colour <- palette$text[[match.arg(type, names(palette$text))]]
  line_colour <- ifelse(inner, palette$line[['inner']], palette$line[['outer']])
  
  # Functions to define axes title distances' from axis (with sensible imnimum/maximum values).
  x_title_spacing <- function(spacing) 
    max(-1.2, -(spacing / 1.25) + 0.5)
  
  y_title_spacing <- function(spacing) 
    max(0.8, min(2.4, spacing))
    
  theme_set(theme(
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
      debug=FALSE,
      margin=margin(),
      family = '', 
      face = "plain", 
      colour = text_colour, 
      size = text_size, 
      hjust = 0.5, 
      vjust = 0.5, 
      angle = 0, 
      lineheight = 0.9), 
    axis.text = element_text(
      debug=FALSE,
      margin=margin(),
      size = rel(0.8), 
      colour = text_colour), 
    strip.text = element_text(
      debug=FALSE,
      margin=margin(),
      size = rel(0.8)), 
    axis.line = element_line(
      colour = line_colour),
    axis.line.x = layout$axis.line.x(colour = line_colour),
    axis.line.y = layout$axis.line.y(colour = line_colour),
    axis.text.x = element_text(
      debug=FALSE,
      margin=margin(0.1 * spacing, 0.1 * spacing, 0.1 * spacing, 0.1 * spacing, unit = 'cm'),
      vjust = 1, 
      colour = text_colour, 
      face='bold'), 
    axis.text.y = element_text(
      debug=FALSE,
      margin=margin(0.1 * spacing, 0.1 * spacing, 0.1 * spacing, 0.1 * spacing, unit = 'cm'),
      hjust = 1, 
      colour = text_colour, 
      face='bold'), 
    axis.ticks = layout$axis.ticks(colour = line_colour),
    axis.title = layout$axis.title(colour = text_colour),
    axis.title.x = element_text(
      debug=FALSE,
      margin=margin(),
      vjust=x_title_spacing(spacing)), 
    axis.title.y = element_text(
      debug=FALSE,
      margin=margin(),
      angle = 90, 
      vjust=y_title_spacing(spacing)), 
    axis.ticks.length = grid::unit(0.15, "cm"), 
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
      debug=FALSE,
      margin=margin(),
      size = rel(0.8)), 
    legend.text.align = NULL, 
    legend.title = element_text(
      debug=FALSE,
      margin=margin(),
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
    panel.margin.x = NULL, 
    panel.margin.y = NULL, 
    strip.background = element_rect(
      fill = ifelse(inner, 'white', palette$background), 
      colour = NA), 
    strip.text = layout$strip.text(colour=text_colour),
    strip.text.x = element_text(
      debug=FALSE,
      margin=margin(),
      size = rel(1.1), 
      face = 'bold'), 
    strip.text.y = element_text(
      debug=FALSE,
      margin=margin(),
      angle = -90,
      face = 'bold',
      size = rel(1.1)), 
    plot.background = element_rect(
      colour = ifelse(inner, 'white', palette$background),
      fill = ifelse(inner, 'white', palette$background)), 
    plot.title = element_text(
      debug=FALSE,
      margin=margin(),
      size = rel(1.2), 
      vjust = spacing + 0.2, 
      face='bold'), 
    plot.margin = grid::unit(c(0.625, 0.625, 0.625, 0.625) * spacing, 'cm'), 
    complete = TRUE
  ))
  
}
