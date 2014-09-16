rethemr <- function() {
  themr <- get_themr()
  with(themr, ggthemr(palette, layout, spacing, text_size, type))
}
