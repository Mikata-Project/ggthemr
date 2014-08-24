#' @title Change the swatch colours in a ggthemr theme
#' @description Edit an existing theme's swatch. The swatch contains the main colours used in a ggplot outside of the colours for the title, axes text, axes lines, gridlines, background etc.
#' @param themr ggthemr object
#' @param new_swatch new colours to use in themr swatch
#' @description The first colour of the swatch is separate from the others. It is used in special cases e.g. the outline colour for geom_boxplot(). This colour should have good contrast with at least the second colour of the swatch. 
#' @include swatch.R
#' @export
#' @examples
#' themr <- ggthemr('grass')
#' 
#' # Completely replace existing swatch. 
#' themr <- set_swatch(themr, c('black', 'green', 'blue', 'white', 'pink', 'purple', 'red')) 
#' 
#' # Add another colour onto existing swatch.
#' themr <- set_swatch(themr, c(swatch(themr), 'purple'))
#' 
#' # Check that new colour is present.
#' swatch(themr)
set_swatch <- function(x, new_colours) {
  verify_ggthemr(x)
  swatch(x) <- new_colours
  rethemr(x)
}
