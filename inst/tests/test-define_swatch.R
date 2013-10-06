test_that('incorrect colours not allowed in swatch', { 
  expect_warning(define_swatch('red'))
  expect_error(define_swatch('periwinkle blue'))
  expect_identical(class(define_swatch(colors()[1:8])), 'ggthemr.swatch')
})