% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colour_contrast.R
\name{darken_palette}
\alias{darken_palette}
\title{Make ggthemr palette darker}
\usage{
darken_palette(amount)
}
\arguments{
\item{amount}{value between 0 and 1 indicating by how much the colours should be darker/lighter.}
}
\description{
Update a ggthemr palette so that colours are darker by some specified amount. This includes everything (background, axes lines, swatch colours, gradient etc.).
}
\examples{
ggthemr('dust')
darken_palette(0.2)
}
\author{
Ciaran Tobin
}
