#' @title Reset Theme
#' @description Remove ggthemr theme and restore the ggplot2 default.
#' @export
#' @author Ciaran Tobin
ggthemr_reset <- function () {
  
  if (is_ggthemr_active()) {
    
    # resetting scales
    options('ggplot2.discrete.fill' = NULL)
    options('ggplot2.discrete.color' = NULL)
    options('ggplot2.continuous.fill' = NULL)
    options('ggplot2.continuous.color' = NULL)
    
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