#' Create colour plot of ggthemr palette
#' @param x ggthemr palette object.
#' @method plot ggthemr.palette
#' @export
plot.ggthemr.palette <- function(x) 
  colour_plot(x)

#' Create colour plot of ggthemr swatch
#' @param x ggthemr swatch object.
#' @method plot ggthemr.swatch
#' @export
plot.ggthemr_swatch <- function(x)
  colour_plot(x)
