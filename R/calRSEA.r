calRSEA <- function(x) {
#load the dependent packages
library(dplyr)
library(gage)
library(gridExtra)
library(grid)
library(ggplot2)
library(ggsci)
library(ggthemes)
#data cleaning
rfeature_list <- x
rfeature_list = rfeature_list[rfeature_list != "Inf"] #remove the dirty data
rfeature_list = rfeature_list[!duplicated(names(rfeature_list))]  #remove the duplicated value
rfeature_list = rfeature_list[!(rfeature_list==1)] #remove the dirty data
rfeature_list = sort(rfeature_list, decreasing = TRUE) #sort dataset
# head(rfeature_list_line1) 
# barplot(rfeature_list_line1)

#load RFEA sets
library(fgsea)
#pathways <- fgsea::gmtPathways("radiomic_feature_sets_sorted_List.gmt") 
#remove NA
for (i in 1:length(pathways)) { 
  pathways[[i]] <- pathways[[i]][pathways[[i]]!=""]}

#RSEA analysis
fgseaRes_l <- fgsea(pathways, rfeature_list)  
fgseaRes_l <- fgseaRes_l[order(padj, -abs(NES)),] 
#head(fgseaRes_l[order(padj, -abs(NES)), ], n=10) 

RSEA.result_l <- data.frame(fgseaRes_l)
RSEA.result_l <- RSEA.result_l[,-ncol(RSEA.result_l)] #remove list
return(RSEA.result_l)
}#over
