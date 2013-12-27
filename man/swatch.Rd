\name{swatch}
\alias{swatch}
\alias{swatch.ggthemr}
\alias{swatch.ggthemr.palette}
\title{Retrieve the swatch colours from a ggthemr object}
\usage{
  swatch(x)

  \method{swatch}{ggthemr} (x)

  \method{swatch}{ggthemr.palette} (x)
}
\arguments{
  \item{x}{ggthemr or ggthemr palette object.}
}
\description{
  The swatch is the main set of colours used for plotting
  data in a ggplot2 plot. This definition excludes the
  colours used for the plot background, title/axis text,
  gridlines etc.
}
\examples{
themr <- ggthemr('sea')
swatch(themr)
}

