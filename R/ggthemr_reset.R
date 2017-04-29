#' @title Reset Theme
#' @description Remove ggthemr theme and restore the ggplot2 default.
#' @export
#' @author Ciaran Tobin
ggthemr_reset <- function () {
  
  if (is_ggthemr_active()) {
  
    # removing scales
    scales <- expand.grid(c('colour', 'fill'), c('continuous', 'discrete', 'gradient'))
    rm(list = apply(scales, 1L, function (x) sprintf('scale_%s_%s', x[1L], x[2L])), envir = .GlobalEnv)
    
    # resetting geoms
    current_theme_info <- get_themr()
    for (one_geom_defaults in current_theme_info$geom_defaults$orig) {
      do.call(what = update_geom_defaults, args = one_geom_defaults) 
    }
    
    # reset theme
    theme_set(theme_grey())
    
    # clear the current theme info
    clear_themr()
  }
}