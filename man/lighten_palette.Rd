\name{lighten_palette}
\alias{lighten_palette}
\title{Make ggthemr palette lighter}
\usage{
  lighten_palette(themr, amount)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{amount}{value between 0 and 1 indicating by how
  much the palette colours should be lighter.}
}
\description{
  Update a ggthemr palette so that colours are lighter by
  some specified amount. This includes everything
  (background, axes lines, swatch colours, gradient etc.).
}
\examples{
themr <- ggthemr('pale')
lighten_palette(themr, 0.2)
}
\author{
  Ciaran Tobin
}

