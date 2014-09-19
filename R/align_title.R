#' @title Align title left
#' @description Align ggplot2 title to the left.
#' @export
align_title_left <- function () 
  theme(plot.title = element_text(hjust = 0))

#' @title Align title right
#' @description Align ggplot2 title to the right.
#' @export
align_title_right <- function () 
  theme(plot.title = element_text(hjust = 1))