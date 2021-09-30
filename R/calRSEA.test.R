calRSEA.test <- function(x) {
library(dplyr)
library(gage)
library(gridExtra)
library(grid)
library(ggplot2)
library(ggsci)
library(ggthemes)
library(fgsea)
rfeature_list <- x
#RSEA analysis
fgseaRes_l <- fgsea(pathways, rfeature_list)  
fgseaRes_l <- data.frame(fgseaRes_l)
fgseaRes_l <- fgseaRes_l[order(fgseaRes_l$pval),] 
RSEA.result_l <- data.frame(fgseaRes_l)
RSEA.result_l <- RSEA.result_l[,-ncol(RSEA.result_l)] #remove list
return(RSEA.result_l)
}
