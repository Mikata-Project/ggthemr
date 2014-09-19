#' @title Rotate ggplot2 x-axis labels
#' @description Rotate the x-axis labels/text by a given angle.
#' @param angle The angle of rotation.
#' @param align
#' @author Ciaran Tobin
#' @export
rotate_x_labels <- function (angle, align = TRUE) 
  theme(axis.text.x = element_text(angle = angle))

#' @title Rotate ggplot2 x-axis labels
#' @description Rotate the x-axis labels/text by a given angle.
#' @inheritParams rotate_x_labels
#' @author Ciaran Tobin
#' @export
rotate_y_labels <- function (angle, align = TRUE) 
  theme(axis.text.y = element_text(angle = angle))
