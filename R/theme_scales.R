#' @importFrom scales seq_gradient_pal
theme_scales <- function(palette) {
  
  colours <- palette$swatch[-1]
  
  new_scale_functions <- list(
    scale_colour_discrete   = function(...) discrete_scale(  'colour', 'ggthemr', discrete_colours(colours), ...),
    scale_fill_discrete     = function(...) discrete_scale(  'fill',   'ggthemr', discrete_colours(colours), ...),
    scale_colour_continuous = function(...) continuous_scale('colour', 'ggthemr', seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...),
    scale_fill_continuous   = function(...) continuous_scale('fill',   'ggthemr', seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...),
    scale_colour_gradient   = function(...) continuous_scale('colour', 'ggthemr', seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...),
    scale_fill_gradient     = function(...) continuous_scale('fill',   'ggthemr', seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...)
  )
  
  new_scale_functions
}


theme_geoms <- function(palette, line_weight) {
  
  colours <- palette$swatch[-1]
  
  new_geom_defaults <- list(
    # Geoms that only require a default colour.  
    list(geom = 'abline',    new = list(colour = colours[1])),
    list(geom = 'point',     new = list(colour = colours[1])),
    list(geom = 'density',   new = list(colour = colours[1])),
    list(geom = 'errorbar',  new = list(colour = colours[1])),
    list(geom = 'errorbarh', new = list(colour = colours[1])),
    list(geom = 'hline',     new = list(colour = colours[1])),
    list(geom = 'vline',     new = list(colour = colours[1])),
    list(geom = 'line',      new = list(colour = colours[1])),
    
    list(geom = 'text',      new = list(colour = palette$swatch[1])),
    
    # Geoms that only require a default fill.
    list(geom = 'area',      new = list(fill   = colours[1])),
    list(geom = 'ribbon',    new = list(fill   = colours[1])),
    list(geom = 'bar',       new = list(fill   = colours[1])),
    list(geom = 'col',       new = list(fill   = colours[1])),
    list(geom = 'dotplot',   new = list(fill   = colours[1])),
    
    # Special geoms.
    list(geom = 'boxplot',   new = list(colour = palette$swatch[1], fill = colours[1], size = line_weight)),
    list(geom = 'smooth',    new = list(colour = colours[2],        fill = colours[2])),
    list(geom = 'dotplot',   new = list(colour = colours[1],        fill = colours[1]))
  )
  
  names(new_geom_defaults) <- vapply(new_geom_defaults, function(x) x$geom, 'temp', USE.NAMES = FALSE)
  
  orig_geom_defaults <- lapply(names(new_geom_defaults), function(x) {
    list(geom = x,
         new  = get(paste0('geom_', x))()$geom$default_aes)
  })
  names(orig_geom_defaults) <- names(new_geom_defaults)
  
  list(orig = orig_geom_defaults, new = new_geom_defaults)
}
