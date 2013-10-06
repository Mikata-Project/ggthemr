get_colours <- function(themr, elements = NULL) {
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.', call. = FALSE)
  if (is.null(elements))
    return (themr$palette$object$swatch)
  else extract_colours(elements, themr$palette$object) 
}

x <- data.frame(x = 1:100, y = jitter(1:100, 15), colour = 'red')
ggplot(x, aes(x, y)) + geom_point()
ggplot(x, aes_auto(x)) + geom_point()
