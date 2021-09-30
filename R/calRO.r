##RO analysis
calRO <- function(x,sumfeature=720) {
  library(fgsea)
  library(dplyr)
  library(gage)
  library(gridExtra)
  library(grid)
  library(ggplot2)
  library(ggsci)
  library(ggthemes)
  library(hypeR)
#data cleaning
rfeature_list <- x
rfeature_list <- rfeature_list[!duplicated(rfeature_list)]  
#load RFEA sets
#pathways <- fgsea::gmtPathways("radiomic_feature_sets_sorted_List.gmt") 
#remove NA
for (i in 1:length(pathways)) { 
  pathways[[i]] <- pathways[[i]][pathways[[i]]!=""]}
#RO analysis
hyp_obj <- hypeR::hypeR(rfeature_list, pathways,background = sumfeature)
hypeR::hyp_to_excel(hyp_obj, file_path=paste("RO",'results',Sys.Date(),"csv",sep="."))
}#over
