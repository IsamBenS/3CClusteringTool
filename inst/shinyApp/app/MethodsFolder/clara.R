fct.parameters <- list("k"=c(0,50,1000,50),"samples"=c(0,5,100,5),"sampsize"=c(0,10,1100,80))
fct.parameters.description <- list("Number of clusters.",
                        "Number of samples to draw from the data.",
                        "Number of events in each sample.")

BRP_BM.clara.execute <- function(fcs.file, params = list(50,5,80,0), markers_col)
{
    k <- min(nrow(fcs.file@exprs), as.numeric(params[[1]]))
    samp.size <- min(max(40+2*as.numeric(params[[1]]), as.numeric(params[[3]])), nrow(fcs.file@exprs))
    
    fcs.out.clara <- clara(fcs.file@exprs[,as.numeric(markers_col)], 
                           k = k,
                           samples = as.numeric(params[[2]]),
                           sampsize = samp.size, 
                           trace = 0)
    
    fcs.labels <- matrix(fcs.out.clara$clustering, ncol=1)
    colnames(fcs.labels) <- paste0("cluster_clara.",ncol(fcs.file@exprs)+1)
    
    return(fcs.labels)
}
