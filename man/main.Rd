\name{ClusteringTool.run}
\alias{ClusteringTool.run}
\title{Clustering Tool}
\usage{
ClusteringTool.run()
}
\description{
Run the shiny app "Clustering Tool". Uses FlowSOM, clara, hclust and kmeans to cluster and enrich fcs files and make them compatible with the "Analysis Tool". 
}
\examples{
%YOU MIGHT HAVE TO LOAD ANOTHER R SESSION BEFORE USING THE TOOL
library(ClusteringTool)
ClusteringTool.run()
}
