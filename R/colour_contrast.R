validate_contrast <- function(amount)
  if (amount < 0 | amount > 1) stop('amount must be between 0 and 1.', call. = FALSE)

#' Make ggthemr swatch darker
#' 
#' Update a ggthemr swatch so that colours are darker by some specified amount. 
#' 
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the swatch colours should be darkened.
#' @examples
#' themr <- ggthemr('pale')
#' darken_swatch(themr, 0.2)
#' @author Ciaran Tobin

darken_swatch <- function(themr, amount) {
  validate_contrast(amount)
  swatch_contrast(themr, -amount)
}

#' Make ggthemr swatch lighter
#' 
#' Update a ggthemr swatch so that colours are lighter by some specified amount.
#' 
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the swatch colours should be lighter.
#' @examples
#' themr <- ggthemr('pale')
#' lighten_swatch(themr, 0.2)
#' @author Ciaran Tobin

lighten_swatch <- function(themr, amount) {
  validate_contrast(amount)
  swatch_contrast(themr, amount)  
}

#' Make ggthemr gradient darker
#' 
#' Update a ggthemr gradient so that colours are darker by some specified amount.
#' 
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the gradient colours should be darker.
#' @examples
#' themr <- ggthemr('pale')
#' darken_gradient(themr, 0.2)
#' @author Ciaran Tobin

darken_gradient <- function(themr, amount) {
  validate_contrast(amount)
  gradient_contrast(themr, -amount)
}

#' Make ggthemr gradient lighter
#' 
#' Update a ggthemr gradient so that colours are lighter by some specified amount.
#' 
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the gradient colours should be lighter.
#' @examples
#' themr <- ggthemr('pale')
#' lighten_gradient(themr, 0.2)
#' @author Ciaran Tobin

lighten_gradient <- function(themr, amount) {
  validate_contrast(amount)
  gradient_contrast(themr, amount)  
}

#' Make ggthemr palette darker
#' 
#' Update a ggthemr palette so that colours are darker by some specified amount. This includes everything (background, axes lines, swatch colours, gradient etc.).
#'
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the palette colours should be darker.
#' @examples
#' themr <- ggthemr('pale')
#' darken_palette(themr, 0.2)
#' @author Ciaran Tobin

darken_palette <- function(themr, amount) {
  validate_contrast(amount)
  palette_contrast(themr, -amount)
}

#' Make ggthemr palette lighter
#' 
#' Update a ggthemr palette so that colours are lighter by some specified amount. This includes everything (background, axes lines, swatch colours, gradient etc.).
#'
#' @param themr ggthemr object.
#' @param amount value between 0 and 1 indicating by how much the palette colours should be lighter.
#' @examples
#' themr <- ggthemr('pale')
#' lighten_palette(themr, 0.2)
#' @author Ciaran Tobin

lighten_palette <- function(themr, amount) {
  validate_contrast(amount)
  palette_contrast(themr, amount)  
}

swatch_contrast <- function(themr, amount) { 
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.') 
  themr$palette$object$swatch <- colour_contrast(themr$palette$object$swatch, amount)
  themr$palette$name <- 'custom'
  theme_scales(themr$palette$object)
  return (themr)
}

palette_contrast <- function(themr, amount) {
  palette <- themr$palette$object
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.') 
  palette$swatch <- colour_contrast(palette$swatch, amount)
  palette$background <- colour_contrast(palette$background, amount)
  palette$line <- colour_contrast(palette$line, amount)
  palette$gridline <- colour_contrast(palette$gridline, amount)
  palette$text[['inner']] <- colour_contrast(palette$text[['inner']], amount)
  palette$text[['outer']] <- colour_contrast(palette$text[['outer']], amount)
  themr$palette$object <- palette
  themr$palette$name <- 'custom'
  rethemr(themr, FALSE)
}

gradient_contrast <- function(themr, amount) {
  if (!is_ggthemr(themr))
    stop('themr is not a ggthemr object.') 
  gradient <- c(themr$palette$object$gradient)
  darker <- colour_contrast(gradient, amount)
  themr$palette$object$gradient <- darker
  themr$palette$name <- 'custom'
  theme_scales(themr$palette$object)
  return (themr)
}

colour_contrast <- function(x, amount) {
  rgbed <- grDevices::col2rgb(x) / 255
  rgbed <- rgbed + amount
  over_range <- rgbed > 1
  if (any(over_range))
    rgbed[over_range] <- 1
  under_range <- rgbed < 0
  if (any(under_range))
    rgbed[under_range] <- 0
  to_hex <- function(x) do.call(rgb, as.list(x))
  apply(rgbed, 2, to_hex)
}
