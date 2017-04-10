#' Create a D3 JavaScript hive network plot
#'
#' This package in an implementation of the hive network graph developed by Martin Krzysinski (see
#' \url{http://egweb.bcgsc.ca/}) and implemented in D3 by Mike Bostock and Rich Morin
#' (see \url{https://bost.ocks.org/mike/hive/} and
#' \url{https://bl.ocks.org/mbostock/2066415}).
#'
#' @param links a data frame with the link definitions between the nodes. Both
#' the \code{source} node id and \code{target} node id should be included for each
#' link.
#' @param nodes a data frame containing the node id and position. It should
#' include the id, \code{id}, the axis id, \code{x}, and position, \code{y}, for each node. Both ids should be
#' numbered starting from 0 and the positions between 0 and 1.
#' @param innerRadius the spacing from the center of the graph to the inner radius of
#' the hive plot in pixels.
#' @param outerRadius the spacing from the center of the graph to the outer radius of
#' the hive plot in pixels.
#' @param width numeric width for the network graph's frame area in pixels.
#' @param height numeric height for the network graph's frame area in pixels.
#' @param elementId defined the HTML object's id.
#'
#' @examples
#' \dontrun{
#'
#' nodes = data.frame(id=c(0,1,2,3,4,5),x=c(0,0,1,1,2,2), y=c(.1,.9,.2,.3,.1,.8))
#' links = data.frame(source=c(0,1,2,2,3,4,5),
#'                    target=c(2,3,4,5,5,0,1))
#'
#' hive(nodes=nodes,links=links, width = "100%", height = "500px")
#'
#' }
#'
#' @source
#' D3.js and d3.hive.js were created by Michael Bostock and the latter with
#' the help of Rich Morin. Documentation can be found on \url{http://d3js.org/}
#' and \url{https://bost.ocks.org/mike/hive/} respectively. Hive plots were
#' developed by Martin Krzywinski, et al. \url{http://egweb.bcgsc.ca/}
#'
#' @import htmlwidgets
#'
#' @export
hive <- function(nodes, links, innerRadius=40, outerRadius = 240, width = NULL, height = NULL, elementId = NULL) {

  # sort in order of node id
  nodes <- nodes[order(nodes$id),]
  nodes$id <- NULL

  # forward options using x
  x = list(
    nodes = nodes,
    links = links,
    numAxis = max(nodes$x)+1,
    options = list(innerRadius=innerRadius,
                   outerRadius=outerRadius)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'hive',
    x,
    width = width,
    height = height,
    package = 'hiveD3',
    elementId = elementId
  )
}

#' Shiny bindings for hive
#'
#' Output and render functions for using hive within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a hive
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name hive-shiny
#'
#' @export
hiveOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'hive', width, height, package = 'hiveD3')
}

#' @rdname hive-shiny
#' @export
renderHive <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, hiveOutput, env, quoted = TRUE)
}
