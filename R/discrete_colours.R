discrete_colours <- function(colours) {
  force(colours)
  function(n) {
    if (n > length(colours)) {
      stop("Your data requires ", n, " colours but the swatch provided by ggthemr only has ", 
                  length(colours), ". To resolve this you can provide an appropriate vector of colours to your scale or expand the swatch using edit_swatch(). Note: if you are using a custom palette, the first swatch colour is separate from the others. See the documentation for define_palette() and/or edit_swatch()", call.=FALSE)
    } else {
      colours[1:n]
    }
  }
}
