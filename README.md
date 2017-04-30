# hiveD3 for R

This package in an implementation of the hive network graph developed by Martin Krzysinski (see http://egweb.bcgsc.ca/) and implemented in D3 by Mike Bostock and Rich Morin (see https://bost.ocks.org/mike/hive/ and https://bl.ocks.org/mbostock/2066415).

## Download the package
    install.packages('devtools')
    library(devtools)
    install_github('nielsenmarkus11/hiveD3')

## Examples
    # Example 1
    nodes = data.frame(id=c(1,0,2,3,4,5),
                       x=c(0,0,1,1,2,2), 
                       y=c(.1,.9,.2,.3,.1,.8),
                       color=c(0,1,0,0,1,2))
    links = data.frame(source=c(0,1,2,2,3,4,5),
                       target=c(2,3,4,5,5,0,1))
    hive(nodes=nodes,links=links, width = "100%", height = "500px")
    
    # Example 2
    nodes = data.frame(id=c(0,1,2,3,4,5,6,7),
                       x=c(0,0,1,1,2,2,3,3), 
                       y=c(.1,.9,.2,.3,.1,.8,.4,.5))
    links = data.frame(source=c(0,1,2,2,3,4,5,6,7),
                       target=c(2,3,4,5,5,6,7,0,1))
    hive(nodes=nodes,links=links, width = "100%", height = "500px")
    
    # Example 3
    nodes = data.frame(x=c(0,0,1,1,2,2,3,3,4), 
                       y=c(.1,.9,.2,.3,.1,.8,.4,.5,.9))
    links = data.frame(source=c(0,1,2,2,3,4,5,6,7,8,8),
                       target=c(2,3,4,5,5,6,7,8,8,0,1))
    hive(nodes=nodes,links=links, width = "100%", height = "500px", elementId = "hive-plot")
