#'
#' Reverse ggplot2 gradient colours
#' 
#' @param themr ggthemr object.
#' @param static TRUE will return the new ggthemr object. FALSE will apply the changes and not return anything.
#' 
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('pale')
#' reverse_gradient(themr)
#' @export

reverse_gradient <- function(themr, static = FALSE) {
  if (!is_ggthemr(themr))
    stop('Cannot reverse gradient because themr is not a ggthemr object.')
  names(themr$palette$object$gradient) <- rev(names(themr$palette$object$gradient))
  theme_scales(themr$palette$object)
  themr$palette$name <- 'custom'
  if (!static) return (themr)
}
