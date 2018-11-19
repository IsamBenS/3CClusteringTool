fct.parameters <- list("xgrid"=c(0,10,100,20),"ygrid"=c(0,10,100,20))
fct.parameters.description <- list("Number of x size of the grid (Number of clusters = xgrid * ygrid).",
                        "Number of y size of the grid (Number of clusters = xgrid * ygrid).")

BRP_BM.SOM.execute <- function(fcs.file, params = list(10,10), markers_col)
{
    fcs.out.SOM <- fcs.file@exprs[,as.numeric(markers_col)]
    
    
    x.d <- as.numeric(params[[1]])
    y.d <- as.numeric(params[[2]])
    if(x.d*y.d > nrow(fcs.file@exprs))
    {
        x.d <- as.integer(sqrt(nrow(fcs.file@exprs)))
        y.d <- as.integer(sqrt(nrow(fcs.file@exprs)))
    }
    
    fcs.out.SOM <- kohonen::som(fcs.out.SOM)
    fcs.labels <- matrix(unlist(fcs.out.SOM$unit.classif), ncol=1)
    colnames(fcs.labels) <- paste0("cluster_SOM.",ncol(fcs.file@exprs)+1)

    return(fcs.labels)
}
