#' Display ggthemr object properties
#' @param x ggthemr object.
#' @method print ggthemr
#' @export
print.ggthemr <- function(x) {
  cat('Palette:   ', x$palette$name, '\n',
      'Layout:    ', x$layout$name, '\n',
      'Text size: ', x$text_size, '\n',
      'Spacing:   ', x$spacing, sep='')
}
