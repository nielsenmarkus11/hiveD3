% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hive.R
\name{hive-shiny}
\alias{hive-shiny}
\alias{hiveOutput}
\alias{renderHive}
\title{Shiny bindings for hive}
\usage{
hiveOutput(outputId, width = "100\%", height = "400px")

renderHive(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{expr}{An expression that generates a hive}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\description{
Output and render functions for using hive within Shiny
applications and interactive Rmd documents.
}
