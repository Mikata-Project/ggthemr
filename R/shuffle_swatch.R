#'
#' Shuffle ggplot2 swatch colours
#' 
#' Randomly reorder plot swatch colours.
#' 
#' @param themr ggthemr object.
#' @param static TRUE will return the new ggthemr object. FALSE will apply the changes and not return anything.
#' 
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('pale')
#' shuffle_swatch(themr)
#' @export

shuffle_swatch <- function(themr, static = FALSE) {
  if (!is_ggthemr(themr))
    stop('Cannot shuffle colours because themr is not a ggthemr object.')
  themr$palette$object$swatch[-1] <- sample(themr$palette$object$swatch[-1])
  theme_scales(themr$palette$object)
  themr$palette$name <- 'custom'
  if (!static) return (themr)
}
