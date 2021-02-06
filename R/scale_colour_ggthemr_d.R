#' ggthemr colour scale
#'
#' A utility function for applying the currently selected ggthemr palette to a ggplot object
#'
#' @param ... optional parameters to be passed through to \link[ggplot2]{discrete_scale}
#' @examples
#' ggplot(mtcars, aes(mpg, disp, colour = factor(am))) + geom_point() + scale_colour_ggthemr_d()
#'
#' @export

scale_colour_ggthemr_d <- function(...) {
  ggplot2::discrete_scale(
             "colour", "ggthemr",
             discrete_colours(swatch()[-1]),
             ...
           )
}

scale_color_ggthemr_d <- scale_colour_ggthemr_d
