#' @title Remove ggplot2 Legend Title
#' @description Remove the legend title from a ggplot2 plot.
#' @author Ciaran Tobin
#' @export
no_legend_title <- function () 
  theme(legend.title = element_blank())