# Analysis Tool
Analysis tool used in a pipeline meant to establish the efficiency of clustering algorithms. Developped as a shiny app.
 
>[You may find additional information here :](doc/temp.pdf)
	
## Requirements
  * software: R(Version 3.4.3 to 3.5), Rstudio(optional)
  * R packages: flowcore, microbenchmark, ncdfFlow, shiny, shinydashboard, shinyjs, doSNOW, cluster, parallel
  
## Quick installation guide

  1. Run the following command in R/RStudio:
```
install.packages(c("flowCore","microbenchmark,, "shiny", "shinyjs", "shinydashboard","cluster","parallel","doSNOW"))
source("https://bioconductor.org/biocLite.R")
biocLite("Biobase")
biocLite("flowCore")
biocLite("FlowSOM")
biocLite("ncdfFlow")
```
  >You may be asked to reload your environment, if so, accept.
  
  2. Run the next commands:
```
library("devtools")
install_github("isambens/ClusteringTool")
```

  
## Launching the shiny application

  1. Run the following commands in R/RStudio:
```
library("ClusteringTool")
ClusteringTool.run()
```  