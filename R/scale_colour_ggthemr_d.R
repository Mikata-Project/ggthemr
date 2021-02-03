scale_colour_ggthemr_d <- function(...) {
  ggplot2::discrete_scale(
             "colour", "ggthemr",
             discrete_colours(swatch()[-1]),
             ...
           )
}

scale_color_ggthemr_d <- scale_colour_ggthemr_d
