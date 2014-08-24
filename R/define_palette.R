#' @title Create ggthemr palette
#' @description Create a custom palette that can be used by ggthemr. Checks will be carried out to make sure colours are not duplicated and are appropriate (e.g. the text colour should not match the background colour or text will not be visible). 
#' 
#' Default colours for the background, text, axes lines and gridlines have been provided, but it is recommended that you overwrite these to make a nice theme.
#' @param swatch Vector of colours used for plotting data i.e. the main colours used for the points in geom_point(), bars in geom_bar() etc.
#' @param gradient Vector of length two specifiying the lower and upper colours used for gradients.
#' @param background Background colour.
#' @param text Text colour. This should be either a single colour or a vector of two colours (see details). 
#' @param line Axes line colour. This should be either a single colour or a vector of two colours (see details).
#' @param gridline Major and minor gridline colours.
#' @details The text and axes line colours can both be provided as single 
#' colours or vectors of two colours. If only one colour is provided then 
#' the text and line colours will be identical regardless of the theme 
#' type ("inner" or "outer", see \code{\link{ggthemr}} for more details). 
#' Where your palette doesn't really need different text/line colours for 
#' the theme type than it sufficient to supply only one colour but a 
#' warning will be issued.
#' 
#' Vectors supplied for the text and line colours can have elements named "inner" and "outer". In the absence of these names, the first will be assumed to be the "inner" colour, the second will be the "outer" colour.
#' @return Object of type ggthemr_palette that you can pass to ggthemr().
#' @export
#' @examples
#' # Create ugly theme with primary colours.
#' ugly <- define_palette(
#'   swatch = c('black', 'red', 'green', 'blue', 'brown', 'purple', 'yellow'), 
#'   gradient = c(lower = 'red', upper = 'green')
#' )
#'   
#' ggthemr(ugly)
#' @author Ciaran Tobin
define_palette <- function(swatch, gradient,
  background = '#ffffff', 
  text = c('#444444', '#444444'), 
  line = c('#6e6e6e', '#6e6e6e'), 
  gridline = '#c3c3c3'
) {
  
  n_text <- length(text)
  if (n_text == 1L) {
    warning('You should supply a vector of length two for the text colour. The first element being the colour used for plots of type "inner". The second when for plots of type "outer".', call. = FALSE)
    text_inner <- text
    text_outer <- text
  } else if (n_text > 2L) {
    warning('You have supplied two many colours for the text colour. Only the first two will be used.', call. = FALSE)
  } else {
    text_inner <- text[1L]
    text_outer <- text[2L]
  }
  
  n_line <- length(line)
  if (n_line == 1L) {
    warning('You should supply a vector of length two for the axis line colour. The first element being the colour used for plots of type "inner". The second when for plots of type "outer".', call. = FALSE)
    line_inner <- line
    line_outer <- line
  } else if (n_line > 2L) {
    warning('You have supplied two many colours for the axes line colour. Only the first two will be used.', call. = FALSE)
  } else {
    line_inner <- line[1L]
    line_outer <- line[2L]
  }
      
  if (any(duplicated(sapply(swatch, unname_colour)))) warning('Duplicate plot colours.')
  clash_warning_any('Some plot colours are the same as the background.', swatch, background)
  clash_warning_any('Some gradient colours are the same as the background.', gradient, background)  
  
  clash_error("The inner text colour is the same as the background colour. Text will not be visible.", background, text_inner)
  clash_error("The outer text colour is the same as the background colour. Text will not be visible.", background, text_outer)
  
  clash_warning("The inner line colour is the same as the background colour. Axes lines will not be visible. If this is desired it is more appropriate to a layout where axes lines are not present.", line_inner, background)
  clash_warning("The outer line colour is the same as the background colour. Axes lines will not be visible. If this is desired it is more appropriate to a layout where axes lines are not present.", line_outer, background)

  clash_warning("The gridline colour is the same as the background colour. Gridlines will not be visible. If this is desired it is more appropriate to define a new layout where gridlines are not present.", gridline, background)
    
  palette <- list(
    background = background, 
    text = c(inner = text_inner, outer = text_outer), 
    line = c(inner = line_inner, outer = line_outer),
    gridline = gridline,
    swatch = define_swatch(swatch),
    gradient = define_gradient(gradient)
  )
  
  if (!all(sapply(unlist(palette), is.character)))
    stop('You must only supply colours as characters.', call. = FALSE)
  
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

define_gradient <- function (x) {
  
  if (length(x) < 2L)
    stop("You must provide two gradient colours (low and high respectively).", call. = FALSE)
  
  if (length(x) > 2L) 
    warning('You have supplied too many colours for the gradient. Taking only the first two or those named "low" and "high".', call. = FALSE)
  
  if (x[[1L]] == x[[2L]])
    stop("The gradient colours are the same.", call. = FALSE)
  
  nm <- names(x)
  if (length(nm) == 2L & all(c('low', 'high') %in% nm)) {
    return (c(low = x[['low']], high = x[['high']]))
  } else {
    return (c(low = x[[1L]], high = x[[2L]]))
  }
  
}