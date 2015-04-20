#' @title Retrieve the swatch colours from a ggthemr object
#' @description The swatch is the main set of colours used for plotting data in a ggplot2 plot. This definition excludes the colours used for the plot background, title/axis text, gridlines etc. 
#' @examples
#' ggthemr('dust')
#' @rdname swatch
#' @export swatch
swatch <- function() {
  get_themr()$palette$swatch
}
