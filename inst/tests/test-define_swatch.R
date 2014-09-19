test_that('incorrect colours not allowed in swatch', { 
  
  random_colours <- sample(colors(), 100L)
  
  # Too few colours.
  expect_error(define_swatch(NULL))
  expect_error(define_swatch(random_colours[1]))
  expect_warning(define_swatch(random_colours[1:2]))
  expect_warning(define_swatch(random_colours[1:5]))
  
  # Check return class type.
  expect_identical(class(define_swatch(colors()[1:8])), 'ggthemr_swatch')
  
  # Duplicate colours.
  expect_error(define_swatch(c(random_colors[1:4], 'red', 'red')))
    
})