
display_list <- function(x, last = 'and') {
  n <- length(x)
  if (n == 1) return (x)
  else return (paste(paste(head(x, -1), collapse = ', '), last, x[n]))
} 
