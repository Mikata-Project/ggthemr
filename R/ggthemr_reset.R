#' @title Reset Theme
#' @description Remove ggthemr theme and restore the ggplot2 default.
#' @export
#' @author Ciaran Tobin
ggthemr_reset <- function () {
  
  if (is_ggthemr_active()) {
  
    scales <- expand.grid(c('colour', 'fill'), c('continuous', 'discrete', 'gradient'))
    rm(list = apply(scales, 1L, function (x) sprintf('scale_%s_%s', x[1L], x[2L])), envir = .GlobalEnv)
    
    # Find list of all geoms to reset.
    geoms <- ls(pattern = '^geom_', envir = as.environment('package:ggplot2'))
    for (geom in geoms) {
    
      # Get the short goem name. E.g. for 'geom_bar' it would be 'bar'.
      geom_name <- strsplit(geom, '_')[[1L]][-1L]
      
      # Some geoms cannot be reset because they have unusual parameters (e.g. geom_map).
      try({
        
        # Extract defaults.
        geom_defaults <- get(geom)()$geom$default_aes()
        
        # Set default again.
        update_geom_defaults(geom_name, geom_defaults)
        
      }, silent = TRUE)
      
    }
    
    clear_themr()
    theme_set(theme_grey())
    
  }
}