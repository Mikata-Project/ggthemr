#' @title Retrieve the swatch colours from a ggthemr object
#' @description The swatch is the main set of colours used for plotting data in a ggplot2 plot. This definition excludes the colours used for the plot background, title/axis text, gridlines etc. 
#' @param x ggthemr or ggthemr palette object.
#' @examples
#' themr <- ggthemr('sea')
#' swatch(themr)
#' @rdname swatch
#' @export swatch
swatch <- function(x) UseMethod('swatch', x)


#' @rdname swatch
#' @method swatch ggthemr
#' @S3method swatch ggthemr
swatch.ggthemr <- function(x) x$palette$object$swatch


#' @rdname swatch
#' @method swatch ggthemr.palette
#' @S3method swatch ggthemr.palette
swatch.ggthemr.palette <- function(x) x$swatch
