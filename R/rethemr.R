rethemr <- function(themr, static = FALSE) {
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.')
  with(themr, ggthemr(palette$object, layout$object, spacing, text_size, type, static))
}
