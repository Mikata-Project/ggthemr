#' @title Change the swatch colours in a ggthemr theme
#' @description Edit an existing theme's swatch. The swatch contains the main colours used in a ggplot outside of the colours for the title, axes text, axes lines, gridlines, background etc.
#' @param swatch_colours new colours to use in themr swatch
#' @description The first colour of the swatch is separate from the others. It is used in special cases e.g. the outline colour for geom_boxplot(). This colour should have good contrast with at least the second colour of the swatch. 
#' @export
set_swatch <- function (swatch_colours) {
  themr <- get_themr()
  themr$palette$swatch <- define_swatch(swatch_colours)
  set_themr(themr)
  rethemr()
}
