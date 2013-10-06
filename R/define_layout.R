define_layout <- function(plot_title, axis_title, strip_text, axis_line_x, axis_line_y, axis_ticks, panel_grid_major, panel_grid_minor) {
  
  if (!is.list(layout))
    stop('palette must be a list.')
  
  # Major elements the layout must contain.
  elements <- c("plot.title", "axis.title", "strip.text", "axis.line.x", "axis.line.y", 
                "axis.ticks", "panel.grid.major", "panel.grid.minor")
  
  # Check which elements exist in the palette.
  elements_check <- !elements %in% names(layout)
  
  # Determine if any elements are missing.
  if (any(elements_check)) 
    stop(paste0('Your palette must include these elements: ', paste(elements, collapse=', '), 
                '. Currently missing ', paste(elements[elements_check], collapse=', '), '.'))
  
  # Check elements are full functions.
  function_check <- sapply(layout, is.function)
  
  if (!all(function_check)) 
    stop(paste0("All elements must be functions. The following elements are not: ", 
                paste(names(layout)[!function_check], collapse=", "), "."))
   
}
