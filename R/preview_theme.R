#' @importFrom gridExtra grid.arrange
#' @importFrom grid textGrob gpar
preview_theme  <- function(themr = NULL, save_to = NULL) {
  
  if (!exists(".Random.seed", mode="numeric"))
    sample(NA)
  
  old_seed <- .Random.seed
  
  set.seed(1)
  data_subset <- seq(0, 100, 5)
  usage <- as.numeric(WWWusage)[data_subset]
  times <- (1:100)[data_subset]
  www <- data.frame(Users = usage, Minute = times, Measure = 'Actual')
  www <- rbind(www, transform(www, Users = jitter(www$Users, factor = 500) / 2, Measure = 'Jitter'))
  
  drivers <- transform(as.data.frame(Seatbelts), Year = factor(1969:1984))
  names(drivers)[1] <- 'Deaths'
  
  driver_x <- scale_x_discrete(breaks = seq(1969, 1984, 3), label = function(x) paste0("'", substr(x, 3, 4)))  
  display_theme <- list(theme(legend.position = 'none'), scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE)))
  
  display <- list(
    
    ggplot(www, aes_string(x = 'Minute', y = 'Users', colour = 'Measure', shape = 'Measure')) + 
      geom_line() + 
      geom_point(size = 3L, colour = get_themr()$palette$background) + 
      geom_point(size = 1.8) +
      scale_shape_manual(values = c(15L, 16L)) +
      legend_top(),
    
    ggplot(transform(mtcars, cyl = factor(cyl)), aes_string(x = 'mpg', fill = 'cyl', colour = 'cyl')) + 
      geom_density(alpha = 0.75) + 
      labs(fill = 'Cylinders', colour = 'Cylinders', x = 'MPG', y = 'Density') +
      legend_top(),
    
    ggplot(transform(diamonds, cut = factor(cut)), aes_string(x = 'price', fill = 'cut')) + 
      geom_histogram(binwidth = 850) + 
      display_theme + 
      xlab('Price (USD)') + 
      ylab('Count') + 
      scale_x_continuous(label = function(x) paste0(x / 1000, 'k')),
    
    ggplot(drivers, aes_string(x = 'Year', y = 'Deaths')) + 
      geom_boxplot(size = 0.25) + 
      ylab('Monthly Deaths') + 
      display_theme + 
      driver_x
    
  )
 
  assign(".Random.seed", old_seed, envir=globalenv())
  do.call(grid.arrange,  display)
  
}
