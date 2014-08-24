define_swatch <- function(x) {
  n <- length(x)
  if (n < 1) 
    stop('No colours provided for swatch.', call. = FALSE)
  if (n < 2) 
    stop('You must have at least two colours in the swatch (seven recommended).', call. = FALSE)
  validate_colours(x)
  if (n < 6) 
    warning('It is recommended that you provide at least seven colours for the swatch.', call. = FALSE)
  if (any(duplicated(sapply(x, unname_colour)))) 
    warning('Duplicate colours in swatch.', call. = FALSE)
  structure(x, class = 'ggthemr_swatch')
}
