extract_colours <- function(x, ...)
  UseMethod('extract_colours', x)

extract_colours.numeric <- function(x, palette) {
  colours <- palette$colours
  n <- length(colours)
  if (!all(x %in% 1:n))
    stop('There are only ', n, ' colours in the palette. Please provide an index between 1 and ', n, '.', call. = FALSE)
  return (colours[x])
}

extract_colours.character <- function(themr, palette)  {
  if (!is_ggthemr(themr))
    stop('themr must be a ggthemr object.', call. = FALSE)
  result <- with(palette, list(text = text[[themr$type]], line = line[[themr$type]], background = background, gridline = gridline, main = main, gradient = gradient))[x]
  null_result <- sapply(result, is.null)
  if (any(null_result)) 
    stop(display_list(x[null_result], 'or'), ' not found.', call. = FALSE)
  return (unlist(result, TRUE, FALSE))
}
