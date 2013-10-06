\name{darken_palette}
\alias{darken_palette}
\title{Make ggthemr palette darker}
\usage{
  darken_palette(themr, amount)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{amount}{value between 0 and 1 indicating by how
  much the palette colours should be darker.}
}
\description{
  Update a ggthemr palette so that colours are darker by
  some specified amount. This includes everything
  (background, axes lines, swatch colours, gradient etc.).
}
\examples{
themr <- ggthemr('pale')
darken_palette(themr, 0.2)
}
\author{
  Ciaran Tobin
}

