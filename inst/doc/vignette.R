## ----eval = FALSE-------------------------------------------------------------
#  data = readRDS("Example.rds")
#  object = data$count
#  label = data$labels

## ----eval = FALSE-------------------------------------------------------------
#  result = phitest(object, label, ncores = 2)
#  result$pval

## ----eval = FALSE-------------------------------------------------------------
#  library(ggplot2)
#  labels = names(result$par)
#  par = lapply(labels, function(l){
#    tp = result$par[[l]]
#    tp$cluster = l
#    return(tp)
#  })
#  par = Reduce(rbind, par)
#  ggplot(par, aes(x = dhat, y = dhat.c)) +
#    geom_point(shape = 1, cex = .5) +
#    geom_abline(intercept = 0, slope = 1, color = "red") +
#    facet_wrap(~cluster) +
#    xlab("Estimated frequency of zero count (gene-specific dispersion)") +
#    ylab("Estimated frequency of zero count (common dispersion)")

