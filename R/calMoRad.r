##calculate each MoRad model
calMoRad <- function(x) {
data <- data.frame(t(x)) #prepare the dataset to accommodate to next steps
data[] <- lapply(data, as.numeric)
library(matrixStats)
myscore3<-data.frame(matrix(nrow=ncol(data),ncol=0))
for (i in 1:length(data.morads)) { #loop1
mydata<-data.frame(data[row.names(data.morads[[i]])[-1],]) #select radiomic features for score calculation
myscore<-data.frame(matrix(nrow=ncol(data),ncol=0)) #generate initial result matrix
for (j in 1:ncol(data.morads[[i]])) { #loop2
mydata2 <- mydata*(data.morads[[i]][-1,j]) #calculate the score with radiomic features and coefficients in each model
myscore2 <- colSums(mydata2, na.rm = TRUE)+data.morads[[i]][1,j] #weighted sum
myscore <- cbind(myscore,myscore2) #generate final result matrix
}
colnames(myscore) <- paste(names(data.morads)[i],colnames(data.morads[[i]]),sep=".") #rename columns
myscore3 <- cbind(myscore3,myscore) #generate result matrix
}
return(myscore3)#over
}
