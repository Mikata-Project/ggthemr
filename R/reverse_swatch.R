#' @title Reverse ggplot2 swatch colours
#' @seealso \code{\link{swatch}}
#' @param themr ggthemr object.
#' @param static TRUE will return the new ggthemr object. FALSE will apply the changes and not return anything.
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('sea')
#' reverse_swatch(themr)
#' @export

reverse_swatch <- function(themr, static = FALSE) {
  if (!is_ggthemr(themr))
    stop('Cannot reverse colours because themr is not a ggthemr object.')
  themr$palette$object$swatch[-1] <- rev(themr$palette$object$swatch[-1])
  theme_scales(themr$palette$object)
  themr$palette$name <- 'custom'
  if (!static) return (themr)
}
