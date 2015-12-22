# download dataset.zip if not exist and unzip all directory

if(!file.exists("dataset.zip")){
     uri<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(uri,destfile = "dataset.zip")  
}

unzip("dataset.zip",files=NULL,overwrite = T)

# from training and test data merge datasets
trainingtable<-read.table("UCI HAR Dataset/train/X_train.txt",header = F)
testtable<-read.table("UCI HAR Dataset/test/X_test.txt",header = F)

eetable<-rbind(trainingtable,testtable)

#read features for mean and std and create the index vector
features<-read.table("UCI HAR Dataset/features.txt")
names(features)<-c("index","name")

meanIndex<-features[grep("mean",features$name),1]
stdIndex <-features[grep("std",features$name),1]
indexes <- c(meanIndex,stdIndex)

#restrict dataset to include only specified index
filterTable<-eetable[,indexes]

#set names for specified index
names(filterTable)<-features[indexes,2]

#union y-data and create the new column
traininglabel<-read.table("UCI HAR Dataset/train/Y_train.txt",header = F)
testlabel<-read.table("UCI HAR Dataset/test/Y_test.txt",header = F)
eelabel<-rbind(traininglabel,testlabel)
names(eelabel)<-c("Subject")



filterTable<-cbind(filterTable,eelabel)

#create tidy dataset 

tidy <- aggregate(filterTable[, 1:79],by =  list(filterTable$Subject), mean)
names(tidy)[1] = "Subject"


write.table(tidy,row.name=FALSE,file="tidy.txt")
