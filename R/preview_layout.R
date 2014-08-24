preview_layout <- function () {
  x_values <- c('One', 'Two', 'Three')
  blank_data <- data.frame(
    x = factor(x_values, x_values),
    y = seq(1000, 3000, 1000),
    check.names = FALSE)
  ggplot(blank_data, aes(x, y)) + geom_blank() +
    scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE, trim = TRUE)) +
    labs(x = 'X Title', y = 'Y Title', title = 'Title')
}