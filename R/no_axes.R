#' @title Remove ggplot2 Axes
#' @description Remove both axes from a ggplot2 including the axes lines, titles, labels and ticks.
#' @author Ciaran Tobin
#' @export
no_axes <- function () 
  theme(axis.line = element_blank(), 
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())


#' @title Remove ggplot2 x-axis
#' @description Remove the x axis from a ggplot2 including the axis lines, titles, labels and ticks.
#' @author Ciaran Tobin
#' @export
no_x_axis <- function () 
  theme(axis.line.x = element_blank(), 
        axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())


#' @title Remove ggplot2 y-axis
#' @description Remove the y-axis from a ggplot2 including the axis lines, titles, labels and ticks.
#' @author Ciaran Tobin
#' @export
no_y_axis <- function () 
  theme(axis.line.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank())


#' @title Remove ggplot2 x-axis line
#' @author Ciaran Tobin
#' @seealso \code{\link{no_y_line}}
#' @export
no_x_line <- function () 
  theme(axis.line.x = element_blank())


#' @title Remove ggplot2 y-axis line
#' @author Ciaran Tobin
#' @seealso \code{\link{no_x_line}}
#' @export
no_y_line <- function () 
  theme(axis.line.y = element_blank())


#' @title Remove ggplot2 x-axis text/labels
#' @author Ciaran Tobin
#' @seealso \code{\link{no_y_text}}
#' @export
no_x_text <- function () 
  theme(axis.text.x = element_blank())


#' @title Remove ggplot2 y-axis text/labels
#' @author Ciaran Tobin
#' @seealso \code{\link{no_x_text}}
#' @export
no_y_text <- function () 
  theme(axis.text.y = element_blank())


#' @title Remove ggplot2 tick marks
#' @author Ciaran Tobin
#' @seealso \code{\link{no_x_ticks}}, \code{\link{no_y_ticks}}
#' @export
no_ticks <- function () 
  theme(axis.ticks = element_blank())


#' @title Remove ggplot2 x-axis tick marks
#' @author Ciaran Tobin
#' @seealso \code{\link{no_ticks}}, \code{\link{no_y_ticks}}
#' @export
no_x_ticks <- function () 
  theme(axis.ticks.x = element_blank())


#' @title Remove ggplot2 y-axis tick marks
#' @author Ciaran Tobin
#' @seealso \code{\link{no_ticks}}, \code{\link{no_x_ticks}}
#' @export
no_y_ticks <- function () 
  theme(axis.ticks.y = element_blank())


#' @title Remove ggplot2 axes titles
#' @author Ciaran Tobin
#' @seealso \code{\link{no_x_title}}, \code{\link{no_y_title}}
#' @export
no_axes_titles <- function () 
  theme(axis.title = element_blank())


#' @title Remove ggplot2 x-axis titles
#' @author Ciaran Tobin
#' @seealso \code{\link{no_axes_titles}}, \code{\link{no_y_title}}
#' @export
no_x_title <- function () 
  theme(axis.title.x = element_blank())


#' @title Remove ggplot2 y-axis titles
#' @author Ciaran Tobin
#' @seealso \code{\link{no_axes_titles}}, \code{\link{no_x_title}}
#' @export
no_y_title <- function () 
  theme(axis.title.y = element_blank())