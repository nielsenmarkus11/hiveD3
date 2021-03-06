% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hive.R
\name{hive}
\alias{hive}
\title{Create a D3 JavaScript hive network plot}
\source{
D3.js and d3.hive.js were created by Michael Bostock and the latter with
the help of Rich Morin. Documentation can be found on \url{http://d3js.org/}
and \url{https://bost.ocks.org/mike/hive/} respectively. Hive plots were
developed by Martin Krzywinski, et al. \url{http://egweb.bcgsc.ca/}
}
\usage{
hive(nodes, links, innerRadius = 40, outerRadius = 240, opacity = 0.7,
  width = NULL, height = NULL, elementId = NULL)
}
\arguments{
\item{nodes}{a data frame containing the node id and position. It should
include the id, \code{id}, the axis id, \code{x}, and position, \code{y}, for each node. Both ids should be
numbered starting from 0 and the positions between 0 and 1.}

\item{links}{a data frame with the link definitions between the nodes. Both
the \code{source} node id and \code{target} node id should be included for each
link.}

\item{innerRadius}{the spacing from the center of the graph to the inner radius of
the hive plot in pixels.}

\item{outerRadius}{the spacing from the center of the graph to the outer radius of
the hive plot in pixels.}

\item{opacity}{the opacity of the links.}

\item{width}{numeric width for the network graph's frame area in pixels.}

\item{height}{numeric height for the network graph's frame area in pixels.}

\item{elementId}{defined the HTML object's id.}
}
\description{
This package in an implementation of the hive network graph developed by Martin Krzysinski (see
\url{http://egweb.bcgsc.ca/}) and implemented in D3 by Mike Bostock and Rich Morin
(see \url{https://bost.ocks.org/mike/hive/} and
\url{https://bl.ocks.org/mbostock/2066415}).
}
\examples{
\dontrun{

nodes = data.frame(id=c(0,1,2,3,4,5),x=c(0,0,1,1,2,2), y=c(.1,.9,.2,.3,.1,.8))
links = data.frame(source=c(0,1,2,2,3,4,5),
                   target=c(2,3,4,5,5,0,1))

hive(nodes=nodes,links=links, width = "100\%", height = "500px")

}

}
