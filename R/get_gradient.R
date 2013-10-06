get_gradient <- function(themr, named = TRUE) {
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.', call. = FALSE)
  gradient <- themr$palette$object$gradient
  if (!named) gradient <- unname(gradient)
  return (gradient)
}
