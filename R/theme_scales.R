#' @importFrom scales seq_gradient_pal
theme_scales <- function(palette) {
  colours <- palette$swatch[-1]
  
  scale_colour_discrete = function(...) {
    discrete_scale('colour', 'ggthemr', discrete_colours(colours), ...)
  }
  
  scale_fill_discrete = function(...) {
    discrete_scale('fill', 'ggthemr', discrete_colours(colours), ...)
  }
  
  if (validate_gradientn_args(palette$gradient)) {
    scale_colour_continuous = function() {
      colours <- if (!missing(colors)) colors else colours
      continuous_scale('colour', 'ggthemr', 
          scales::gradient_n_pal(colours, values, space), guide = guide, ...)
    }
    
    scale_fill_continuous   = function() {
      colours <- if (!missing(colors)) colors else colours
      continuous_scale('fill', 'ggthemr', 
          scales::gradient_n_pal(colours, values, space), guide = guide, ...)
    }
    
    colour_fmls <- formals(ggplot2::scale_colour_gradientn)
    fill_fmls <- formals(ggplot2::scale_fill_gradientn)
    
  } else if (validate_gradient2_args(palette$gradient)) {
    scale_colour_continuous = function() {
      continuous_scale('colour', 'ggthemr', 
          scales::div_gradient_pal(low, mid, high, space), guide = guide, 
          rescaler = ggplot2:::mid_rescaler(mid = midpoint), ...)
    }
    
    scale_fill_continuous   = function() {
      continuous_scale('fill', 'ggthemr', 
          scales::div_gradient_pal(low, mid, high, space), guide = guide, 
          rescaler = ggplot2:::mid_rescaler(mid = midpoint), ...)
    }
    
    colour_fmls <- formals(ggplot2::scale_colour_gradient2)
    fill_fmls <- formals(ggplot2::scale_fill_gradient2)
    
  } else if (validate_gradient_args(palette$gradient)) {
    scale_colour_continuous = function() {
      continuous_scale('colour', 'ggthemr', scales::seq_gradient_pal(low, high, space),
          guide = guide, ...)
    }
    
    scale_fill_continuous   = function() {
      continuous_scale('fill', 'ggthemr', scales::seq_gradient_pal(low, high, space),
          guide = guide, ...)
    }
    
    colour_fmls <- formals(ggplot2::scale_colour_gradient)
    fill_fmls <- formals(ggplot2::scale_fill_gradient)
  }
  
  
  colour_fmls[names(palette$gradient)] <- palette$gradient
  formals(scale_colour_continuous) <- colour_fmls
  formals(scale_color_continuous)  <- colour_fmls
  
  fill_fmls[names(palette$gradient)] <- palette$gradient
  formals(scale_fill_continuous) <- fill_fmls
  
  list(
    scale_colour_continuous = scale_colour_continuous,
    scale_colour_discrete   = scale_colour_discrete,
    scale_colour_gradient   = scale_colour_continuous,
    scale_color_continuous  = scale_colour_continuous,
    scale_color_discrete    = scale_colour_discrete,
    scale_color_gradient    = scale_colour_continuous,
    scale_fill_continuous   = scale_fill_continuous,
    scale_fill_discrete     = scale_fill_discrete,
    scale_fill_gradient     = scale_fill_continuous
  )
}


#' Validate an argument list for required values for ggplot2::scale_*_gradient
#' 
#' @param args a list of arguments to provide to ggplot2::scale_*_gradient
#'   formals
#' @return \code{TRUE} if and only if \code{args} contains named values for both
#'   "low" and "high"
#' 
validate_gradient_args <- function(args, error = FALSE) {
  out <- all(c("low", "high") %in% names(args))
  if (!out && error) 
    stop("You must provide two gradient colours (low and high respectively).", call. = FALSE)
  out
}



#' Validate an argument list for required values for ggplot2::scale_*_gradient2
#' 
#' @param args a list of arguments to provide to ggplot2::scale_*_gradient2
#'   formals
#' @return \code{TRUE} if and only if \code{args} contains named values for both
#'   "low", "mid" and "high"
#' 
validate_gradient2_args <- function(args, error = FALSE) {
  out <- all(c("low", "mid", "high") %in% names(args))
  if (!out && error)
    stop("You must provide three gradient colours (low, mid and high respectively).", call. = FALSE)
  out
}


#' Validate an argument list for required values for ggplot2::scale_*_gradientn
#' 
#' @param args a list of arguments to provide to ggplot2::scale_*_gradientn
#'   formals
#' @return \code{TRUE} if and only if \code{args} contains named values for
#'   "colours" or "color"
#' 
validate_gradientn_args <- function(args, error = FALSE) {
  out <- any(c("colours", "colors") %in% names(args))
  if (!out && error)
    stop("You must provide a vector of colours (either 'colour' or 'color').", call. = FALSE)
  out
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
