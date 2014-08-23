verify_ggthemr <- function (x, message = 'Not a ggthemr object.')
  if (!is_ggthemr(x)) stop(message, call. = FALSE)