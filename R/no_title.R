#' @title Remove ggplot2 title
#' @export
#' @author Ciaran Tobin
#' @seealso 
no_title <- function () 
  theme(plot.title = element_text(hjust = 0))