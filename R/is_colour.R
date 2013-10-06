#' Is a valid colour
#' 
#' Check a single character or vector of characters to see if it is a valid colour.
#'
#' @param x object to be tested.
#' 
#' @examples
#' is_colour('#ffffff')
#' is_colour('white')
#' is_colour('periwinkle blue')
#' is_colour(4L)
#' 
#' @author Ciaran Tobin
#' @description
#' Colours in R can be represented by names (@seealso \\code{\\link{colors}}"), index number (@seealso \\code{\\link{palette}}") or a hexidecimal character.
#' @rdname is_colour
#' @export is_colour

is_colour <- function(x) 
  UseMethod('is_colour', x)


#' @return \code{NULL}
#'
#' @rdname is_colour
#' @method is_colour character
#' @S3method is_colour character

is_colour.character <- function(x)
  grepl('#[a-f0-9]{6}', x, TRUE) | x %in% colors() | is.na(x) | x %in% as.character(seq_along(grDevices::palette()))


#' @return \code{NULL}
#'
#' @rdname is_colour
#' @method is_colour numeric
#' @S3method is_colour numeric

is_colour.numeric <- function(x) 
  x %in% seq_along(grDevices::palette())


#' @return \code{NULL}
#'
#' @rdname is_colour
#' @method is_colour logical
#' @S3method is_colour logical

is_colour.logical <- function(x) 
  is.na(x)

#' @return \code{NULL}
#'
#' @rdname is_colour
#' @method is_colour list
#' @S3method is_colour list
 
is_colour.list <- function(x) 
  sapply(x, is_colour)

#' @return \code{NULL}
#'
#' @rdname is_colour
#' @method is_colour factor
#' @S3method is_colour factor

is_colour.factor <- function(x) 
  is_colour(as.character(x))
