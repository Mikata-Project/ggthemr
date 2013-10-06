\name{shuffle_swatch}
\alias{shuffle_swatch}
\title{Shuffle ggplot2 swatch colours}
\usage{
  shuffle_swatch(themr, static = FALSE)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{static}{TRUE will return the new ggthemr object.
  FALSE will apply the changes and not return anything.}
}
\description{
  Randomly reorder plot swatch colours.
}
\examples{
themr <- ggthemr('pale')
shuffle_swatch(themr)
}
\author{
  Ciaran Tobin
}

