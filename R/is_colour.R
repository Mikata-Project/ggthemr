#' @title Is an object a valid colour?
#' @description Check an object to see if it is a valid colour or set of colours.
#' @details Colours in R can be represented by names (\code{\link{colours}}), index number (\code{\link{palette}}) or a hexidecimal character.
#' @param x object to be tested.
#' @author Ciaran Tobin
#' @examples
#' is_colour('#ffffff')
#' is_colour('white')
#' is_colour('periwinkle blue')
#' is_colour(4L)
#' @export
is_colour <- function(x) 
  UseMethod('is_colour', x)


#' @rdname is_colour
#' @export
#' @importFrom grDevices colors
is_colour.character <- function(x)
  grepl('#[a-f0-9]{6}', x, TRUE) | x %in% colors() | is.na(x) 


#' @rdname is_colour
#' @export
is_colour.numeric <- function(x) 
  x %in% seq_along(grDevices::palette())


#' @rdname is_colour
#' @export
is_colour.logical <- function(x) 
  is.na(x)

#' @rdname is_colour
#' @export
is_colour.factor <- function(x) 
  is_colour.character(as.character(x))
