#' @title Reset Theme
#' @description Remove ggthemr theme and restore the ggplot2 default.
#' @export
#' @author Kohske Takahashi, Ciaran Tobin
ggthemr_reset <- function () {
  if (is_ggthemr_active()) {
    detach('package:ggplot2', unload = TRUE, force = TRUE)
    scales <- expand.grid(c('colour', 'fill'), c('continuous', 'discrete', 'gradient'))
    rm(list = apply(scales, 1L, function (x) sprintf('scale_%s_%s', x[1L], x[2L])), envir = .GlobalEnv)
    suppressPackageStartupMessages(library(ggplot2))
    clear_themr()
  }
}
