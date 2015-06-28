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


#' @title ggplot2 Legend Position
#' @description Move a ggplot2 legend to the top of the plot.
#' @author Ciaran Tobin
#' @rdname legend_position
#' @export
legend_top <- function () 
  move_legend('top')


#' @title ggplot2 Legend Position
#' @description Move a ggplot2 legend to the left of the plot.
#' @author Ciaran Tobin
#' @rdname legend_position
#' @export
legend_left <- function () 
  move_legend('left')


#' @title ggplot2 Legend Position
#' @description Move a ggplot2 legend to the right of the plot.
#' @author Ciaran Tobin
#' @rdname legend_position
#' @export
legend_right <- function () 
  move_legend('right')
