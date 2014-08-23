rethemr <- function(themr) {
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.')
  with(themr, ggthemr(palette, layout, spacing, text_size, type))
}
