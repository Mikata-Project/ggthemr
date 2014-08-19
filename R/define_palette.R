#' Create ggthemr palette.
#' 
#' Create a custom palette that can be used by ggthemr.
#' 
#' @param background background colour.
#' @param text_inner text colour when type is 'inner' (see plot_theme).
#' @param text_outer text colour when type is 'outer' (see plot_theme).
#' @param line axes line colour
#' @param gridline major and minor gridline colours.
#' @param swatch vector of colours used for plotting data i.e. the main colours used in the plot.
#' @param gradient vector of length two specifiying the lower and upper colours used for gradients.
#' @author Ciaran Tobin

define_palette <- function(background, text, line, gridline, swatch, gradient) {
  
  n_text <- length(text)
  if (n_text == 1L) {
    warning('You should supply a vector of length for the text colour. The first element being the colour used for plots of type "inner". The second when for plots of type "outer".', call. = FALSE)
    text_inner <- text
    text_outer <- text
  } else if (n_text > 2L) {
    warning('You have supplied two many colours for text colour. Only the first two will be used.', call. = FALSE)
  } else {
    text_inner <- text[1L]
    text_outer <- text[2L]
  }
  
  n_line <- length(line)
  if (n_line == 1L) {
    warning('You should supply a vector of length for the axis line colour. The first element being the colour used for plots of type "inner". The second when for plots of type "outer".', call. = FALSE)
    line_inner <- line
    line_outer <- line
  } else if (n_line > 2L) {
    warning('You have supplied two many colours for the axes line colour. Only the first two will be used.', call. = FALSE)
  } else {
    line_inner <- line[1L]
    line_outer <- line[2L]
  }
    
  # Must have two gradient colours.
  n_gradient <- length(gradient)
  if (n_gradient != 2)
    stop("You must provide two gradient colours (low and high respectively).")
  
  n_colours <- length(swatch)
  if (n_colours < 6)
    warning(paste0('It is recommended that you supply at least 6 colours for the main palette (only ', 
                   n_colours, ' given).'), call. = FALSE)
  
  # Make sure there aren't silly colour combinations.
  if (gradient[1] == gradient[2]) 
    stop('The gradient colours are the same.', call. = FALSE)
    
  if (any(duplicated(sapply(swatch, unname_colour)))) warning('Duplicate plot colours.')
  clash_warning_any('Some plot colours are the same as the background.', swatch, background)
  clash_warning_any('Some gradient colours are the same as the background.', gradient, background)  
  clash_error("The outer text colour is the same as the background colour. Text will not be visible.", background, text_outer)
  clash_error("The inner text colour is white. Text will not be visible.", text_inner, '#ffffff')
  clash_warning("The line colour is the same as the background colour. Axis lines will not be visible. If this is desired it is more appropriate to use new layout where axes lines are not present.", line, background)
  clash_warning("The gridline colour is the same as the background colour. Gridlines will not be visible. If this is desired it is more appropriate to define a new layout where gridlines are not present.", gridline, background)
    
  palette <- list(
    background = background, 
    text = c(inner = text_inner, outer = text_outer), 
    line = c(inner = line_inner, outer = line_outer),
    gridline = gridline,
    swatch = unname(swatch),
    gradient = unname(gradient)
  )
  
  if (!all(sapply(unlist(palette), is.character)))
    stop('You must only supply colours as characters.')
  
  class(palette) <- 'ggthemr_palette'
  
  return (palette)
  
}

colour_clash <- function(...) {
  x <- c(...)
  named_colours <- !grepl('#[a-z0-9]{6}', x, TRUE)
  x[named_colours] <- sapply(x[named_colours], unname_colour)
  any(duplicated(tolower(x)))
}

clash_warning_any <- function(warning_message, m_colour, s_colour) {
  if (any(sapply(m_colour, colour_clash, s_colour)))
    warning(warning_message, call. = FALSE)
}

unname_colour <- function(x) 
  do.call(rgb, as.list(col2rgb(x) / 255))  

clash_warning <- function(warning_message, ...) 
  if (colour_clash(...)) warning(warning_message, call. = FALSE)

clash_error <- function(stop_message, ...)
  if (colour_clash(...)) stop(stop_message, call. = FALSE)
