#' @title Shuffle ggthemr swatch colours
#' @description Randomly reorder plot swatch colours.
#' @author Ciaran Tobin
#' @examples
#' ggthemr('pale')
#' shuffle_swatch()
#' @export
shuffle_swatch <- function () {
  themr <- get_themr()
  themr$palette$swatch[-1] <- sample(swatch()[-1])
  set_themr(themr)
  rethemr()
}
