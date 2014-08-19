define_swatch <- function(x) {
  n <- length(x)
  if (n < 1) 
    stop('No colours provided.')
  validate_colours(x)
  if (n < 6) 
    warning('It is recommended that you provide at least six colours for a swatch.')
  if (any(duplicated(sapply(x, unname_colour)))) warning('Duplicate colours.')
  structure(x, class = 'ggthemr_swatch')
}
