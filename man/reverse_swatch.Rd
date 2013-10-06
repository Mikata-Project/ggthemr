\name{reverse_swatch}
\alias{reverse_swatch}
\title{Reverse ggplot2 swatch colours}
\usage{
  reverse_swatch(themr, static = FALSE)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{static}{TRUE will return the new ggthemr object.
  FALSE will apply the changes and not return anything.}
}
\description{
  Reverse ggplot2 swatch colours
}
\examples{
themr <- ggthemr('pale')
reverse_swatch(themr)
}
\author{
  Ciaran Tobin
}

