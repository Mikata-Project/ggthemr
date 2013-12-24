#' Is a ggthemr object
#' 
#' Test an object to determine if it is of class ggthemr.
#' 
#' @param x object to test.
#' 
#' @examples
#' themr <- ggthemr('sea')
#' is_ggthemr(themr)
#' 
#' @author Ciaran Tobin

is_ggthemr <- function(x)
  inherits(x, 'ggthemr')
