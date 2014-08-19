preview_layout <- function (x = NULL)
  UseMethod('preview_layout', x)

preview_layout.default <- function (x = NULL) {
  blank_data <- data.frame(
    x = c('One', 'Two', 'Three'),
    y = seq(1000, 3000, 1000),
    check.names = FALSE)
  ggplot(blank_data, aes(x, y)) + geom_blank() +
    scale_y_continuous(label = function(x) format(x, big.mark = ",", scientific = FALSE, trim = TRUE)) +
    labs(x = 'X Title', y = 'Y Title', title = 'Title')
}

preview_layout.character <- function (x) {
  old <- theme_get()
  ggthemr(layout = x)
  print(preview_layout())
  theme_set(old)
}

preview_layout.factor <- preview_layout.character

preview_layout.ggthemrLayout <- function (x) {
  
}