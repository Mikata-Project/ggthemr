\name{swatch}
\alias{swatch}
\title{Retrieve the swatch colours from a ggthemr object}
\usage{
  swatch(themr, preserve_object = FALSE)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{preserve_object}{FALSE (default) will return a
  character vector of the colours in the swatch. TRUE will
  return a ggthemr swatch object.}
}
\description{
  The swatch is the main set of colours used for plotting
  data in the a ggplot2 plot. This definition excludes the
  colours used for the plot background, title/axis text,
  gridlines etc.
}
\examples{
themr <- ggthemr('pale')
swatch(themr)
}

