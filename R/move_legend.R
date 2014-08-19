#' @title Move legend.
#' @description move legend to given location.
#' @param position The location of the legend ('top', 'bottom', 'right', 'left' or 'none').
move_legend <- function (position) 
  theme(legend.position = position)


#' @title ggplot2 Legend Position
#' @description Move a ggplot2 legend to the bottom of the plot.
#' @author Ciaran Tobin
#' @rdname legend_position
#' @export
legend_bottom <- function () 
  move_legend('bottom')

#' @rdname legend_position
legend_top <- function () 
  move_legend('top')

#' @rdname legend_position
legend_left <- function () 
  move_legend('left')

#' @rdname legend_position
legend_right <- function () 
  move_legend('right')
