#' Retrieve the swatch colours from a ggthemr object
#' 
#' The swatch is the main set of colours used for plotting data in the a ggplot2 plot. This definition excludes the colours used for the plot background, title/axis text, gridlines etc. 
#' @param themr ggthemr object.
#' @param preserve_object FALSE (default) will return a character vector of the colours in the swatch. TRUE will return a ggthemr swatch object.
#' @examples
#' themr <- ggthemr('pale')
#' swatch(themr)
#' @export

swatch <- function(themr) {
  if (!is_ggthemr(themr))
    stop ('Cannot extract swatch since themr is not a ggthemr object.')
  return (themr$palette$object$swatch)
}
