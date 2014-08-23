rethemr <- function(x) {
  verify_ggthemr(x)
  with(x, ggthemr(palette, layout, spacing, text_size, type))
}
