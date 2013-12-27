\docType{package}
\name{ggthemr}
\alias{ggthemr}
\alias{ggthemr-package}
\title{Set theme for ggplot2}
\usage{
  ggthemr(palette = "dust", layout = "clear",
    spacing = 1.6, text_size = 12, type = "inner",
    line_weight = 0.5, static = TRUE)
}
\arguments{
  \item{palette}{Colour scheme by name or ggtheme object.}

  \item{layout}{The layout of gridlines, axes etc.}

  \item{spacing}{A numeric value of how much space should
  exist on any given plot. Low values will result in more
  cramped plots, higher values will have more whitespace.}

  \item{text_size}{base text size.}

  \item{type}{Set to 'inner' where the background colour
  should not extend past strictly the plot area (or "panel"
  in ggplot2 terminology). 'outer' will apply the
  background colour to the entire plot.}

  \item{static}{TRUE will return the colour palette used.
  This may be useful if changes are desired where the plot
  colours are needed. FALSE will only set the theme but not
  return it.}
}
\description{
  Set theme to be applied to all subsequent ggplots.

  ggthemr provides colour schemes and layouts for ggplot2.
}
\examples{
ggthemr('pale', layout = 'scientific', spacing = 2, type = 'inner')
}
\author{
  Ciaran Tobin
}

