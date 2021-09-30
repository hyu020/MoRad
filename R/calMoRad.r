##cal each MoRad model
calMoRad <- function(x) {
data <- data.frame(t(x))
data[] <- lapply(data, as.numeric)
library(matrixStats)
myscore3<-data.frame(matrix(nrow=ncol(data),ncol=0))
for (i in 1:length(data.morads)) {
mydata<-data.frame(data[row.names(data.morads[[i]])[-1],])
myscore<-data.frame(matrix(nrow=ncol(data),ncol=0))
for (j in 1:ncol(data.morads[[i]])) {
mydata2 <- mydata*(data.morads[[i]][-1,j])
myscore2 <- colSums(mydata2, na.rm = TRUE)+data.morads[[i]][1,j]
myscore <- cbind(myscore,myscore2)
}
colnames(myscore) <- paste(names(data.morads)[i],colnames(data.morads[[i]]),sep=".")
myscore3 <- cbind(myscore3,myscore)
}
return(myscore3)#over
}
