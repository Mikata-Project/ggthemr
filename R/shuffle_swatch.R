#' @title Shuffle ggthemr swatch colours
#' @description Randomly reorder plot swatch colours.
#' @param x ggthemr object.
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('pale')
#' shuffle_swatch(themr)
shuffle_swatch <- function (x) {
  verify_ggthemr(x)
  x$palette$swatch[-1] <- sample(swatch(x)[-1])
  rethemr(x)
}
