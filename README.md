# hiveD3 for R

This package in an implementation of the hive network graph developed by Martin Krzysinski (see http://egweb.bcgsc.ca/) and implemented in D3 by Mike Bostock and Rich Morin (see https://bost.ocks.org/mike/hive/ and https://bl.ocks.org/mbostock/2066415).

## Download the package
    install.packages('devtools')
    library(devtools)
    install_github('nielsenmarkus11/hiveD3')

## Example
    library(hiveD3)

    nodes = data.frame(x=c(0,0,1,1,2,2), y=c(.1,.9,.2,.3,.1,.8))
    links = data.frame(source=c(0,1,2,2,3,4,5),
                       target=c(2,3,4,5,5,0,1))


    hive(nodes=nodes,links=links, width = "100%", height = "500px")
