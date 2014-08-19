#' Create colour plot of ggthemr palette
#' @param x ggthemr palette object.
#' @method plot ggthemr_palette
#' @export
plot.ggthemr <- function(x) 
  colour_plot(x)


#' Create colour plot of ggthemr palette
#' @param x ggthemr palette object.
#' @method plot ggthemr_palette
#' @export
plot.ggthemr_palette <- function(x) 
  colour_plot(x)

#' Create colour plot of ggthemr swatch
#' @param x ggthemr swatch object.
#' @method plot ggthemr_swatch
#' @export
plot.ggthemr_swatch <- function(x)
  colour_plot(x)
