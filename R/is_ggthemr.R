#' @title Is a ggthemr object
#' @description Test an object to determine if it is of class ggthemr.
#' @param x object to test.
#' @author Ciaran Tobin
is_ggthemr <- function(x)
  inherits(x, 'ggthemr')