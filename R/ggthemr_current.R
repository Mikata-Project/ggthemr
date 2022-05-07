themr <- NULL

#' @title Store Theme
#' @description Store ggthemr theme.
#' @importFrom utils assignInMyNamespace
ggthemr_current <- (function () {
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
      assignInMyNamespace('themr', value)
      # themr <<- value
    },
    is_set = function () {
      !is.null(themr)
    },
    clear = function () {
      assignInMyNamespace('themr', NULL)
      # themr <<- NULL
    }
  )
})()


#' @title Get Current Theme
#' @description Get the current ggthemr theme.
get_themr <- function () 
  ggthemr_current$get()

#' @title Set Current Theme
#' @description Set the current ggthemr theme.
#' @param value ggthemr object.
set_themr <- function (value) 
  ggthemr_current$set(value)

is_ggthemr_active <- function () 
  ggthemr_current$is_set()

clear_themr <- function () 
  ggthemr_current$clear()