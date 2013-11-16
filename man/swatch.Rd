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
  \item{themr}{ggthemr object.}

  \item{preserve_object}{FALSE (default) will return a
  character vector of the colours in the swatch. TRUE will
  return a ggthemr swatch object.}
}
\value{
  \code{NULL}

  \code{NULL}
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

