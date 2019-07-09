context('theme_scales gradient handles low/high, low/mid/high & values argument lists')



test_that('validation of scale_*_gradient succeeds when arguments "low" and "high" are included', {
  expect_true(ggthemr:::validate_gradient_args(list(low = "#000000", high = "#111111")))
})

test_that('validation of scale_*_gradient fails when arguments "low" and "high" are not all included', {
  expect_false(ggthemr:::validate_gradient_args(list(low = "#000000")))
})

test_that('validation of scale_*_gradient2 succeeds when arguments "low", "mid" and "high" are included', {
  expect_true(ggthemr:::validate_gradient2_args(list(low = "#000000", mid = "#111111", high = "#222222")))
})

test_that('validation of scale_*_gradient2 fails when arguments "low" and "high" are not all included', {
  expect_false(ggthemr:::validate_gradient2_args(list(low = "#000000")))
})

test_that('validation of scale_*_gradientn succeeds when arguments "colors" or "colours" are included', {
  expect_true(ggthemr:::validate_gradientn_args(list(colors = c("#000000", "#111111"))))
  expect_true(ggthemr:::validate_gradientn_args(list(colours = c("#000000", "#111111"))))
})

test_that('validation of scale_*_gradientn fails when arguments "colors" or "colours" are not included', {
  expect_false(ggthemr:::validate_gradientn_args(list(values = c(1, 2))))
})



test_that('theme_scales gradient accepts low/high character vector', { 
  # in slight deviation from previous behavior, scale_*_continuous now 
  # defaults to using "colours" parameter, which is functionaly identical to 
  # scale_*_gradient when value is a vector of length 2
  
  gradient <- c("#FF0000", "#00FF00")
  env <- new.env()
  
  theme <- ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env)
  
  expect_equal(formals(env$scale_color_continuous)$colours, gradient)
})



test_that('theme_scales gradient accepts named list of arguments for scale_*_gradient', {
  gradient <- list(low = "#FF0000", high = "#00FF00")
  env <- new.env()
  
  theme <- ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env)

  expect_equal(formals(env$scale_color_continuous)[names(gradient)], gradient)
})



test_that('theme_scales gradient accepts named list of arguments for scale_*_gradient2', {
  gradient <- list(low = "#FF0000", mid = "#00FF00", high = "#0000FF")
  env <- new.env()
  
  theme <- ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env)

  expect_equal(formals(env$scale_color_continuous)[names(gradient)], gradient)
})



test_that('theme_scales gradient accepts named list of arguments for scale_*_gradientn', {
  gradient <- list(
    colors = c("#FF0000", "#00FF00", "#0000FF"),
    values = c(0.1, 0.5, 0.9))
  env <- new.env()
  
  theme <- ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env)

  expect_equal(formals(env$scale_color_continuous)[names(gradient)], gradient)
})



test_that('color contrast warning gets triggered for gradient colors specified as argument list', {
  env <- new.env()
  
  gradient <- list(
    colors = c("#FF0000", "#FFFFFF", "#0000FF"),
    values = c(0.1, 0.5, 0.9))
  
  expect_warning(ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env))
  
  gradient <- c("#FFFFFF", "#000000")
  
  expect_warning(ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env))
  
  gradient <- list(low = "#FFFFFF", high = "#000000")
  
  expect_warning(ggthemr(
    palette = ggthemr::define_palette(
      swatch = c("#000000", "#111111", "#222222", "#333333", "#444444", "#555555", "#666666"), 
      gradient = gradient),
    envir = env))
})