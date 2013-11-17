\name{colour_plot}
\alias{colour_plot}
\alias{colour_plot.character}
\alias{colour_plot.ggthemr}
\alias{colour_plot.ggthemr.palette}
\alias{colour_plot.ggthemr.swatch}
\title{Plot colours}
\usage{
  colour_plot(x, ...)

  \method{colour_plot}{character} (x)

  \method{colour_plot}{ggthemr} (x)

  \method{colour_plot}{ggthemr.palette} (x)

  \method{colour_plot}{ggthemr.swatch} (x)
}
\arguments{
  \item{x}{Character vector of colours or ggthemr palette
  object.}
}
\description{
  Display a chart of colours from a vector of colours or
  ggthemr object.
}
\examples{
colour_plot(c('#de6757', 'pink'))
colour_plot(ggthemr('sea'))
}
\author{
  Ciaran Tobin
}

