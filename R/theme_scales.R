# Needs some serious tidying.
theme_scales <- function(palette, line_weight) {
  
  colours <- palette$swatch[-1]
  
  updateGeoms <- function(geoms, parameters) 
    for (geom in geoms) update_geom_defaults(geom, parameters)
  
  # Geoms that only require a default colour.
  updateGeoms(c('abline', 'jitter', 'point', 'density', 'errorbar', 'errorbarh', 'freqpoly', 'hline', 'line', 'text'), list(colour = colours[1]))
    
  # Geoms that only require a default fill.
  updateGeoms(c('area', 'bar', 'histogram', 'dotplot'), list(fill = colours[1]))
  
  # Special geoms.
  update_geom_defaults('boxplot', list(colour = palette$swatch[1], fill = colours[1], outlier.colour = palette$swatch[1], size = line_weight))
  update_geom_defaults('smooth', list(colour = colours[2], fill = colours[2]))
  update_geom_defaults('dotplot', list(colour = colours[1], fill = colours[1]))
  
  # Discrete scales.
  assign('scale_colour_discrete', function(...) discrete_scale('colour', 'ggthemr', discrete_colours(colours), ...), envir=.GlobalEnv)
  assign('scale_fill_discrete', function(...) discrete_scale('fill', 'ggthemr', discrete_colours(colours), ...), envir=.GlobalEnv)
  
  # Continuous scales.
  assign('scale_colour_continuous', function(...) continuous_scale('colour', 'ggthemr', scales::seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...), envir=.GlobalEnv)
  assign('scale_fill_continuous', function(...) continuous_scale('fill', 'ggthemr', scales::seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...), envir=.GlobalEnv)
  
  # Gradient scales.
  assign('scale_colour_gradient', function(...) continuous_scale('colour', 'ggthemr', scales::seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...), envir=.GlobalEnv)
  assign('scale_fill_gradient', function(...) continuous_scale('fill', 'ggthemr', scales::seq_gradient_pal(palette$gradient[['low']], palette$gradient[['high']]), ...), envir=.GlobalEnv)
}
