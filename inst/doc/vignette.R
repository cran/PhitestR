## ----eval = FALSE-------------------------------------------------------------
#  data = readRDS("Cortex2_count.rds")
#  object = data$count
#  label = data$labels

## ----eval = FALSE-------------------------------------------------------------
#  result = phitest(object, label, ncores = 2)
#  result$pval
#  #Oligodendrocyte     Endothelial       Astrocyte
#  #      0.6107304       0.9999999       0.4844792

## ----eval = FALSE-------------------------------------------------------------
#  data = readRDS("Cortex2_Seurat.rds")
#  object = FindClusters(data, resolution = 0.1)
#  table(object$seurat_clusters)

## ----eval = FALSE-------------------------------------------------------------
#  result2 = phitest(object, ncores = 2)
#  result2$pval[1:3]
#  #           4            1            0
#  #1.000000e+00 9.997925e-01 1.549529e-08

## ----eval = FALSE-------------------------------------------------------------
#  library(ggplot2)
#  labels = names(result2$par)
#  par = lapply(labels, function(l){
#    tp = result2$par[[l]]
#    tp$cluster = l
#    return(tp)
#  })
#  par = Reduce(rbind, par)
#  ggplot(par, aes(x = dhat, y = dhat.c)) +
#    geom_point(shape = 1) +
#    geom_abline(intercept = 0, slope = 1, color = "red") +
#    facet_wrap(~cluster) +
#    xlab("Estimated frequency of zero count (gene-specific dispersion)") +
#    ylab("Estimated frequency of zero count (common dispersion)")

