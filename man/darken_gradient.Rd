\name{darken_gradient}
\alias{darken_gradient}
\title{Make ggthemr gradient darker}
\usage{
  darken_gradient(themr, amount)
}
\arguments{
  \item{themr}{ggthemr object.}

  \item{amount}{value between 0 and 1 indicating by how
  much the gradient colours should be darker.}
}
\description{
  Update a ggthemr gradient so that colours are darker by
  some specified amount.
}
\examples{
themr <- ggthemr('pale')
darken_gradient(themr, 0.2)
}
\author{
  Ciaran Tobin
}

