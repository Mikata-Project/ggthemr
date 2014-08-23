#' @title Shuffle ggthemr swatch colours
#' @description Randomly reorder plot swatch colours.
#' @param x ggthemr object.
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('pale')
#' shuffle_swatch(themr)
shuffle_swatch <- function (x) {
  if (!is_ggthemr(x))
    stop('Cannot shuffle colours because themr is not a ggthemr object.')
  x$palette$swatch[-1] <- sample(swatch(x)[-1])
  rethemr(x)
}
