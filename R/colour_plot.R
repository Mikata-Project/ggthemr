#' @title Plot colours
#' @description Display a chart of colours from a vector of colours or ggthemr object.
#' @param x Character vector of colours or ggthemr palette object.
#' @export
#' @author Ciaran Tobin
#' @examples  
#' colour_plot(c('#de6757', 'pink'))
#' colour_plot(ggthemr('sea'))
#' @rdname colour_plot
#' @export colour_plot
colour_plot <- function(x, ...) 
  UseMethod('colour_plot', x)


#' @rdname colour_plot
#' @method colour_plot character
#' @S3method colour_plot character
colour_plot.character <- function(x) 
  plot_colours(x)


#' @rdname colour_plot
#' @method colour_plot ggthemr
#' @S3method colour_plot ggthemr
colour_plot.ggthemr <- function(x) 
  plot_colours(unclass(swatch(x)), x$palette$object$background)


#' @rdname colour_plot
#' @method colour_plot ggthemr.palette
#' @S3method colour_plot ggthemr.palette
colour_plot.ggthemr.palette <- function(x) 
  plot_colours(unclass(swatch(x)), x$background)


#' @rdname colour_plot
#' @method colour_plot ggthemr_swatch
#' @S3method colour_plot ggthemr_swatch
colour_plot.ggthemr_swatch <- function(x) 
  plot_colours(unclass(x))
