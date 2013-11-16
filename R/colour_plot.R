#' Plot colours
#' 
#' Display a chart of colours from a vector of colours or ggthemr palette object.
#' 
#' @param x Character vector of colours or ggthemr palette object.
#' @export
#' @author Ciaran Tobin
#' @examples  
#' colour_plot(c('#de6757', 'pink'))
#' @rdname colour_plot
#' @export colour_plot

colour_plot <- function(x, ...) 
  UseMethod('colour_plot', x)

#' @return \code{NULL}
#'
#' @rdname colour_plot
#' @method colour_plot character
#' @S3method colour_plot character
colour_plot.character <- function(x) 
  plot_colours(x)

#' @return \code{NULL}
#'
#' @rdname colour_plot
#' @method colour_plot ggthemr.palette
#' @S3method colour_plot ggthemr.palette
colour_plot.ggthemr.palette <- function(x) 
  plot_colours(swatch(x), x$background)

#' @return \code{NULL}
#'
#' @rdname colour_plot
#' @method colour_plot ggthemr.swatch
#' @S3method colour_plot ggthemr.swatch
colour_plot.ggthemr.swatch <- function(x) 
  plot_colours(unclass(x))

#' @return \code{NULL}
#'
#' @rdname colour_plot
#' @method colour_plot list
#' @S3method colour_plot list
colour_plot.list <- function(x) {
  ux <- unlist(x)
  colour_x <- ux[sapply(ux, is.character)]
  if (length(colour_x) < 1)
    stop('List does not contain any characters.')
  plot_colours(colour_x)
}

#' @return \code{NULL}
#'
#' @rdname colour_plot
#' @method colour_plot function
#' @S3method colour_plot function
colour_plot.function <- function(x, values) 
  plot_colours(sapply(values, x))
