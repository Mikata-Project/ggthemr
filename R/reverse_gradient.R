#' @title Reverse ggthemr gradient colours
#' @description Flip the colours in a ggthemr gradient.
#' @author Ciaran Tobin
#' @examples
#' ggthemr()
#' reverse_gradient()
#' @export
reverse_gradient <- function() {
  themr <- get_themr()
  names(themr$palette$gradient) <- rev(names(themr$palette$gradient))
  set_themr(themr)
  rethemr()
}
