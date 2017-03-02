#' Create colour plot of ggthemr palette
#' @param x ggthemr object.
#' @param ... other arguments to plot() (these will be ignored).
#' @export
plot.ggthemr <- function (x, ...) 
  colour_plot(x)


#' Create colour plot of ggthemr palette
#' @param x ggthemr palette object.
#' @param ... other arguments to plot() (these will be ignored).
#' @export
plot.ggthemr_palette <- function (x, ...) 
  colour_plot(x)


#' Create colour plot of ggthemr swatch
#' @param x ggthemr swatch object.
#' @param ... other arguments to plot() (these will be ignored).
#' @export
plot.ggthemr_swatch <- function (x, ...)
  colour_plot(x)
