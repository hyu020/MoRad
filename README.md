# MoRad Example Use
library(MoRad) #loading package

head(data.GBM) #sample dataset 1-TCGA-GBM

head(data.LGG) #sample dataset 2-TCGA-LGG

MoRad.scores <- calMoRad(data.GBM) #Profile all available molecular features with MoRad models

calRO(names(rfeature_list)[1:100]) #this will save a spreadsheet(.csv) in your work directory

RSEA.result <- calRSEA(rfeature_list) #RSEA enrichment analysis

plotRSEA(rfeature_list,nrow=3,ncol=3,color.line="#00468BFF") #plot RSEA enrichment outcomes; #change 'color.line' value for line color
