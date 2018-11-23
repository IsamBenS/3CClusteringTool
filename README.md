The 3C Analysis Toolkit is a set of shiny app designed to establish the efficiency of (over)clustering algorithms as well as optimizing their parameters by trying to maximize the F-score.
![Clustering and overclustering](doc/img1.png?raw=true "Clustering and overclustering").
The F-score is defined as the harmonic mean of precision and recall but can also be expressed as a function of True and False Positives and Negatives. Depending on the type of method -- clustering or overclustering -- the computation of the F-score might be modified:
![Clustering - F score computation](doc/img2.png?raw=true "F-score computation with clustering algorithms").
Overclustering is trickier. We chose to group similar clusters into annotated groups.
![Overclustering - F score computation](doc/img3.png?raw=true "F-score computation with overclustering algorithms").

The 3 tools composing this toolkit are independant and can be used at different steps of the analysis. If you wish to create enriched files -- clustering your files and adding columns giving the cluster for each event -- use the "[3C Clustering Tool](http://github.com/isambens/3cclusteringtool))".
If your files were enriched/clustered using an algorithm not supported by 3C Clustering Tool, use "[3C Keywords Registor](http://github.com/isambens/3keywordsregistor))" to add the keywords enabling the analysis of the different algorithms used.
Finally, once your files are enriched and contain the necessary keywords, you can visualize the different parameters causing the F-score to vary, thus exposing the issues which can be encountered while running certain algorithms.
![3C Analysis Pipeline](doc/img4.png?raw=true "3C Analysis Pipeline").



# 3C - Clustering Tool
Shiny app developped to use different clustering algorithms on FCS files. The files are enriched and can then be downloaded and used with the Analysis Tool.
	 
>[User manual](doc/Manual_clusteringtool.pdf)

## Requirements
  * software: R(Version 3.4.3 to 3.5), Rstudio(optional)
  * R packages: flowcore, microbenchmark, ncdfFlow, shiny, shinydashboard, shinyjs, doSNOW, cluster, parallel, ggcyto, SPADECiphe
  
## Quick installation guide

  1. Run the following command in R/RStudio:
```
install.packages(c("microbenchmark", "shiny", "shinyjs", "shinydashboard","cluster","doSNOW","devtools"))
source("https://bioconductor.org/biocLite.R")
biocLite("ggcyto")
biocLite("flowCore")
biocLite("FlowSOM")
biocLite("ncdfFlow")
```
  >You might have to launch a new R session
  
  2. Run the next commands:
```
library("devtools")
install_github("nolanlab/rclusterpp")
install_github("isambens/spadeciphe")
install_github("isambens/ClusteringTool")
```

  
## Launching the shiny application

  1. Run the following commands in R/RStudio:
```
library("ClusteringTool")
ClusteringTool.run()
```  