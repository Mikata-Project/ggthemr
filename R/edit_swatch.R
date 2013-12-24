#' Change the swatch colours in a ggthemr theme
#'
#' Edit an existing theme's swatch. The swatch contains the main colours used in a ggplot outside of the colours for the title, axes text, axes lines, gridlines, background etc.
#' 
#' @param themr ggthemr object
#' @param new_swatch new colours to use in themr swatch
#' @description The first colour of the swatch is separate from the others. It is used in special cases e.g. the outline colour for geom_boxplot(). This colour should have good contrast with at least the second colour of the swatch. 
#' @include swatch.R
#' @examples
#' 
#' themr <- ggthemr('grass', 'scientific')
#' 
#' # Completely replace existing swatch. 
#' themr <- edit_swatch(themr, c('black', 'green', 'blue', 'white', 'pink', 'purple', 'red')) 
#' 
#' # Add another colour onto existing swatch.
#' themr <- edit_swatch(themr, c(swatch(themr), 'purple'))
#' 
#' # Check that new colour is present.
#' swatch(themr)

edit_swatch <- function(themr, new_colours) {
  themr$palette$object$swatch <- define_swatch(new_colours)
  themr$palette$name <- 'custom'
  theme_scales(themr$palette$object)
  return (themr)
}
