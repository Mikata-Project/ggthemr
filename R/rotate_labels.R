#' @title Rotate ggplot2 axes labels
#' @description Rotate both axes labels by a given angle.
#' @param angle The angle of rotation.
#' @author Ciaran Tobin
#' @export
rotate_axes_text <- function (angle) 
  theme(axis.text = element_text(angle = angle))


#' @title Rotate ggplot2 x-axis labels
#' @description Rotate the x-axis labels/text by a given angle.
#' @param angle The angle of rotation.
#' @author Ciaran Tobin
#' @export
rotate_x_text <- function (angle) 
  theme(axis.text.x = element_text(angle = angle))


#' @title Rotate ggplot2 x-axis labels
#' @description Rotate the x-axis labels/text by a given angle.
#' @inheritParams rotate_x_labels
#' @author Ciaran Tobin
#' @export
rotate_y_text <- function (angle) 
  theme(axis.text.y = element_text(angle = angle))
