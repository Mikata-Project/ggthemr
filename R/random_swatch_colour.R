#' @title Random swatch colour
#' @description Gives a random colour from ggthemr swatch. This might be useful if you are producing lots of plots with one colour, which can get a bit boring to look at. You can use this function to get a random colour for each of your plots to make them more interesting. 
#' @param x ggthemr object.
#' @param limit How many colours from the swatch should be considered for sampling (see details).
#' @details The first colour of the swatch will never be returned as this is a special value. The first few colours are usually "better" as they are well suited to the theme and have good contrast with each other. The random colour is therefore limited by default to the first few colours.
#' @export
#' @author Ciaran Tobin
#' @examples
#' themr <- ggthemr('dust')
#' ggplot(diamonds, aes(carat, price)) + 
#'   geom_point(colour = random_swatch_colour(themr))
#' 
#' themr <- ggthemr('camoflauge')
#' colorem <- random_swatch_colour(themr)
#' ggplot(diamonds, aes(color, price)) + 
#'   geom_boxplot(fill = colorem, outlier.colour = colorem)
random_swatch_colour <- function (x, limit = 4L) {
  
  verify_ggthemr(x)
  sw <- swatch(x)[-1L]
  
  if (limit < 0)
    stop('"limit" must be positive or zero.', call. = FALSE)
  
  if (is.null(limit) | limit == 0) {
    
    return (sample(sw, 1L))
    
  } else {
    
    available <- sw[1:min(length(sw), limit)]
    return (sample(available, 1L))
    
  }
  
}
