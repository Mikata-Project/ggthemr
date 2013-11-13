#' Retrieve the swatch colours from a ggthemr object
#' 
#' The swatch is the main set of colours used for plotting data in the a ggplot2 plot. This definition excludes the colours used for the plot background, title/axis text, gridlines etc. 
#' @param themr ggthemr object.
#' @param preserve_object FALSE (default) will return a character vector of the colours in the swatch. TRUE will return a ggthemr swatch object.
#' @examples
#' themr <- ggthemr('pale')
#' swatch(themr)
#' @rdname swatch
#' @export swatch

swatch <- function(x) 
  UseMethod('swatch', x)

#' @return \code{NULL}
#'
#' @rdname swatch
#' @method swatch ggthemr
#' @S3method swatch ggthemr
swatch.ggthemr <- function(x) {
  return (x$palette$object$swatch)
}


#' @return \code{NULL}
#'
#' @rdname swatch
#' @method swatch ggthemr.palette
#' @S3method swatch ggthemr.palette
swatch.ggthemr.palette <- function(x) {
  return (x$swatch)
}
