
test_that('define_palette does not allow incorrect colours.', {
  
  bg_colour <- 'green'
  dp <- function(text_inner = 'black', text_outer = 'black', line = 'black', gridline = 'black', plot_colours = scales::brewer_pal()(6), gradient = scales::brewer_pal()(2)) 
    define_palette(bg_colour, text_inner, text_outer, line, gridline, plot_colours, gradient)
  
#   expect_warning(dp(line = bg_colour))  
#   expect_warning(dp(gridline = bg_colour))
#   expect_warning(dp(gradient = c('black', bg_colour)))  
#   expect_error(dp(text_outer = bg_colour))
#   expect_error(dp(text_inner = 'white'))
#   
#   # Not enough plot colours.
#   expect_warning(dp(plot_colours = 'pink'))
  
  
})

expect_equal(is_colour('#ffffff'), TRUE)
expect_equal(is_colour('#f6f6f6'), TRUE)
expect_equal(is_colour('white'), TRUE)
expect_equal(is_colour('wheat3'), TRUE)
expect_equal(is_colour(8L), TRUE)
expect_equal(is_colour(9L), FALSE)
expect_equal(is_colour('#g6f6f6'), FALSE)
expect_equal(is_colour('greenish'), FALSE)
