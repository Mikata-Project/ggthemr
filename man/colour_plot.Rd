\name{colour_plot}
\alias{colour_plot}
\alias{colour_plot.character}
\alias{colour_plot.function}
\alias{colour_plot.ggthemr.palette}
\alias{colour_plot.ggthemr.swatch}
\alias{colour_plot.list}
\title{Plot colours}
\usage{
  colour_plot(x, ...)

  \method{colour_plot}{character} (x)

  \method{colour_plot}{ggthemr.palette} (x)

  \method{colour_plot}{ggthemr.swatch} (x)

  \method{colour_plot}{list} (x)

  \method{colour_plot}{function} (x, values)
}
\arguments{
  \item{x}{Character vector of colours or ggthemr palette
  object.}
}
\value{
  \code{NULL}

  \code{NULL}

  \code{NULL}

  \code{NULL}

  \code{NULL}
}
\description{
  Display a chart of colours from a vector of colours or
  ggthemr palette object.
}
\examples{
colour_plot(c('#de6757', 'pink'))
}
\author{
  Ciaran Tobin
}

