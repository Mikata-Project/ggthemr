#' Align colours to values
#' 
#' Sometimes you would like certain values to be given certain colours.

align_colours <- function(x)
  UseMethod('align_colours', x)

align_colours.data.frame <- function(x, variable, reference_plot) {
  
  if (length(variable) != 1) 
    stop('You may only supply one variable.')
  
  if (!is.numeric(x) & !is.character(x)) 
    stop('variable must be numeric or character.')
  
  vx <- x[, variable]
  
  if (!is.character(vx) | !is.factor(vx) )   
    stop('variable is not a character or factor.')
  
  
  
}
