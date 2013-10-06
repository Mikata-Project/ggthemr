validate_colours <- function(x, on_invalid = stop) {
  validation <- is_colour(x)
  n_invalid <- sum(!validation)
  if (n_invalid == 1) {
    on_invalid(x[!validation], ' is not a valid colour.', call. = FALSE)
  } else if (n_invalid > 1) {
    on_invalid(display_list(x[!validation]), ' are not valid colours.', call. = FALSE)
  }
}
