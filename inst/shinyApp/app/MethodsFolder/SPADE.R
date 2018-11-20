fct.parameters <- list("k"=c(1,100,1000,200), "apprx_mult"=c(0.1,0.1,3,1.5), "kernel_mult"=c(0.1,0.1,10,5), 
                       "exclude_pctile"=c(0,0.01,1,0.01), "target_pctile"=c(0,0.01,1,0.05))
fct.parameters.description <- list("Number of clusters. Effectively: cut the generated tree at the height giving the chosen number of clusters",
                                   "Multiplier of the minimum median distance within which observations are approximated to have the same density",
                                   "Multiplier of the minimum median distance within which other observations are counted towards the density",
                                   "Numeric value in [0,1]. Densities below this percentile will be excluded.",
                                   "Numeric value in [0,1]. Densities below this percentile, but above exclude_pctile will be retained")

BRP_BM.SPADE.execute <- function(fcs.file, params = list(200,1.5,5,0.01,0.05), markers_col)
{
    #ADD DENSITY============================================================================================================================================
    fcs.dens <- SPADECiphe::SPADE.addDensityToFCSCIPHE(fcs.file, cols = colnames(fcs.file@exprs)[as.numeric(markers_col)], transforms = flowCore::linearTransform(), comp = F,
                                           apprx_mult = as.numeric(params[[2]]), kernel_mult = as.numeric(params[[3]]))
    
    #DOWNSAMPLE=============================================================================================================================================
    fcs.ds <- SPADECiphe::SPADE.downsampleFCSCIPHE(fcs.dens, exclude_pctile=as.numeric(params[[4]]), target_pctile = as.numeric(params[[5]]))
    
    #FCSToTree==============================================================================================================================================
    fcs.tree <- SPADECiphe::SPADE.FCSToTreeCIPHE(fcs.ds, cols = colnames(fcs.file@exprs)[as.numeric(markers_col)], k = as.numeric(params[[1]]), transforms = flowCore::linearTransform(), comp = F)
    
    #UPSAMPLE===============================================================================================================================================
    fcs.up <- SPADECiphe::SPADE.addClusterToFCSCIPHE(fcs.dens, fcs.tree[[1]], cols = colnames(fcs.file@exprs)[as.numeric(markers_col)], transforms = flowCore::linearTransform(), comp = F)
    
    #GENERATE FCS===========================================================================================================================================
    fcs.labels <- matrix(fcs.up@exprs[,ncol(fcs.up@exprs)],ncol=1)
    colnames(fcs.labels) <- paste0("cluster_SPADE.",ncol(fcs.file@exprs)+1)
    
    return(fcs.labels)
}
