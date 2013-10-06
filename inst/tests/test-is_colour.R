
test_that('is_colour does the job', {
  
  expect_equal(is_colour('red'), TRUE)
  expect_equal(is_colour('periwinkle blue'), FALSE)
  
  expect_equal(is_colour(c('red', 'pink')), c(TRUE, TRUE))
  expect_equal(is_colour(c('periwinkle blue', 'blue')), c(FALSE, TRUE))
  
  expect_equal(is_colour('#de6757'), TRUE)
  expect_equal(is_colour('#ge6757'), FALSE)
  expect_equal(is_colour('#de675'), FALSE)
  expect_equal(is_colour('de6757'), FALSE)
  
  expect_equal(is_colour(NA), TRUE)
  
  expect_equal(is_colour(1), TRUE)
  expect_equal(is_colour(0), FALSE)
  expect_equal(is_colour(10), FALSE)
  
  
  
})