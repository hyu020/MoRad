# MoRad Example Use
library(MoRad) #loading package
head(data.GBM) #sample dataset 1-TCGA-GBM
head(data.LGG) #sample dataset 2-TCGA-LGG
MoRad.scores <- calMoRad(data.GBM)
calRO(names(rfeature_list)[1:100]) #this will save a spreadsheet(.csv) in your work directory
RSEA.result <- calRSEA(rfeature_list)
plotRSEA(rfeature_list,nrow=3,ncol=3,color.line="#00468BFF") #change 'color.line' value for line color
