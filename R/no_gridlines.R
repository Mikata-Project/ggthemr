#' @title Remove all gridlines
#' @description Remove all vertical and horizontal gridlines (major and minor) from a ggplot2 plot or theme.
#' @author Ciaran Tobin
#' @export
no_gridlines <- function () 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


#' @title Remove vertical gridlines.
#' @description Remove all major and minor vertical gridlines from a ggplot2 plot or theme.
#' @author Ciaran Tobin
#' @export
no_x_gridlines <- function () 
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank())


#' @export
#' @rdname no_x_gridlines
no_vertical_gridlines <- no_x_gridlines


#' @title Remove horizontal gridlines.
#' @description Remove all major and minor horizontal gridlines from a ggplot2 plot or theme.
#' @author Ciaran Tobin
#' @export
no_y_gridlines <- function () 
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank())


#' @export
#' @rdname no_y_gridlines
no_horizontal_gridlines <- no_y_gridlines

#' @title Remove major gridlines
#' @description Do not show major gridlines
#' @export
no_major_gridlines <- function () 
  theme(panel.grid.major = element_blank())

#' @title Remove minor gridlines
#' @description Do not show minor gridlines
#' @export
no_minor_gridlines <- function () 
  theme(panel.grid.minor = element_blank())

#' @title Remove major x gridlines
#' @description Do not show major gridlines for x-axis
#' @export
no_major_x_gridlines <- function () 
  theme(panel.grid.major.x = element_blank())

#' @title Remove minor x gridlines
#' @description Do not show minor gridlines for x-axis
#' @export
no_minor_x_gridlines <- function () 
  theme(panel.grid.minor.x = element_blank())

#' @title Remove major y gridlines
#' @description Do not show major gridlines for y-axis
#' @export
no_major_y_gridlines <- function () 
  theme(panel.grid.major.y = element_blank())

#' @title Remove minor y gridlines
#' @description Do not show minor gridlines for y-axis
#' @export
no_minor_y_gridlines <- function () 
  theme(panel.grid.minor.y = element_blank())