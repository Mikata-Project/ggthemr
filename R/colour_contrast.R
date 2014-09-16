validate_contrast <- function(amount)
  if (amount < 0 | amount > 1) stop('"amount" must be between 0 and 1.', call. = FALSE)

#' @title Make ggthemr swatch darker
#' @description Update a ggthemr swatch so that colours are darker by some specified amount. 
#' @param amount value between 0 and 1 indicating by how much the swatch colours should be darker/lighter.
#' @examples
#' ggthemr('dust')
#' darken_swatch(themr, 0.2)
#' @author Ciaran Tobin
#' @export
darken_swatch <- function(amount) {
  validate_contrast(amount)
  swatch_contrast(-amount)
}


#' @title Make ggthemr swatch lighter
#' @description Update a ggthemr swatch so that colours are lighter by some specified amount.
#' @inheritParams darken_swatch
#' @examples
#' ggthemr('dust')
#' lighten_swatch(themr, 0.2)
#' @author Ciaran Tobin
#' @export
lighten_swatch <- function(amount) {
  validate_contrast(amount)
  swatch_contrast(amount)  
}


#' @title Make ggthemr gradient darker
#' @description Update a ggthemr gradient so that colours are darker by some specified amount.
#' @inheritParams darken_swatch
#' @examples
#' ggthemr('dust')
#' darken_gradient(0.2)
#' @author Ciaran Tobin
#' @export
darken_gradient <- function(amount) {
  validate_contrast(amount)
  gradient_contrast(-amount)
}

#' @title Make ggthemr gradient lighter
#' @description Update a ggthemr gradient so that colours are lighter by some specified amount.
#' @inheritParams darken_swatch
#' @examples
#' ggthemr('dust')
#' lighten_gradient(themr, 0.2)
#' @author Ciaran Tobin
#' @export
lighten_gradient <- function(amount) {
  validate_contrast(amount)
  gradient_contrast(amount)  
}

#' @title Make ggthemr palette darker
#' @description Update a ggthemr palette so that colours are darker by some specified amount. This includes everything (background, axes lines, swatch colours, gradient etc.).
#' @examples
#' ggthemr('dust')
#' darken_palette(themr, 0.2)
#' @author Ciaran Tobin
#' @export
darken_palette <- function(amount) {
  validate_contrast(amount)
  palette_contrast(-amount)
}

#' @title Make ggthemr palette lighter
#' @description Update a ggthemr palette so that colours are lighter by some specified amount. This includes everything (background, axes lines, swatch colours, gradient etc.).
#' @inheritParams darken_swatch
#' @examples
#' ggthemr('dust')
#' lighten_palette(themr, 0.2)
#' @author Ciaran Tobin
#' @export
lighten_palette <- function(amount) {
  validate_contrast(amount)
  palette_contrast(amount)  
}


swatch_contrast <- function(amount)  
  set_swatch(colour_contrast(swatch(), amount))

palette_contrast <- function(amount) {
  themr <- get_themr()
  palette <- themr$palette
  palette$swatch <- colour_contrast(palette$swatch, amount)
  palette$background <- colour_contrast(palette$background, amount)
  palette$line <- colour_contrast(palette$line, amount)
  palette$gridline <- colour_contrast(palette$gridline, amount)
  palette$text[['inner']] <- colour_contrast(palette$text[['inner']], amount)
  palette$text[['outer']] <- colour_contrast(palette$text[['outer']], amount)
  themr$palette <- palette
  set_themr(themr)
  rethemr()
}

gradient_contrast <- function(amount) {
  themr <- get_themr()
  gradient <- themr$palette$gradient
  updated <- colour_contrast(gradient, amount)
  themr$palette$gradient <- updated
  set_themr(themr)
  rethemr()
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
