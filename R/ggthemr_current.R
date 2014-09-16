#' @title Store Theme
#' @description Store ggthemr theme.
ggthemr_current <- (function () {
  themr <- NULL
  list(
    get = function () {
      if (is.null(themr)) {
        stop('ggthemr theme has not been set yet.', call.=FALSE)
      } else {
        return (themr)
      }
    },
    set = function (value) {
      verify_ggthemr(value)
      themr <<- value
    },
    is_set = function () {
      !is.null(themr)
    },
    clear = function () {
      themr <<- NULL
    }
  )
})()


#' @title Get Current Theme
#' @description Get the current ggthemr theme.
get_themr <- function () 
  ggthemr_current$get()

#' @title Set Current Theme
#' @description Set the current ggthemr theme.
set_themr <- function (value) 
  ggthemr_current$set(value)

#' @export
ggthemr_active <- function () 
  ggthemr_current$is_set()

clear_themr <- function () 
  ggthemr_current$clear()