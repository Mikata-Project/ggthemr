preview_theme  <- function(themr = NULL, save_to = NULL) {
  
  drivers <- transform(as.data.frame(Seatbelts), Year = factor(1969:1984))
  names(drivers)[1] <- 'Deaths'
  
  driver_x <- scale_x_discrete(breaks = seq(1969, 1984, 3), label = function(x) paste0("'", substr(x, 3, 4)))  
  display_theme <- list(theme(legend.position = 'none'), scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE)))
  
  display <- list(
    ggplot(diamonds, aes(price, fill = factor(cut))) + geom_histogram(binwidth = 850) + display_theme + xlab('Price (USD)') + ylab('Count') + scale_x_continuous(label = function(x) paste0(x / 1000, 'k')),
    ggplot(as.data.frame(table(diamonds$clarity, dnn = 'Clarity'), responseName = 'Count'), aes(Clarity, Count)) + geom_bar(stat = 'identity') + display_theme + theme(axis.text.x = element_text(angle = 0, hjust = 1)),
    ggplot(drivers, aes(Year, Deaths)) + geom_boxplot(size = 0.25) + ylab('Monthly Deaths')+ display_theme + driver_x,
    ggplot(aggregate(Deaths ~ Year, drivers, sum), aes(Year, Deaths, group = 1)) + geom_smooth(method = 'loess') + geom_line() + geom_point()  + display_theme + driver_x
  )
  
  if (!is.null(themr)) {
    if (is_ggthemr(themr)) {
      display$main <- textGrob(paste('\n', toupper(themr$palette$name), '\n'), just = 'center', gp = gpar(fontsize=15, fontface = 'bold', fill = themr$palette$object$background, col = themr$palette$object$text[['inner']]))    
    } else {
      warning('themr not a ggthemr object. Displaying plot without title.')
    }
  } 
  
  do.call(gridExtra::grid.arrange,  display)
  
}
