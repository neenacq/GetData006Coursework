#The first step is to load the files into R
test=read.table("./test/X_test.txt", header = F)
testActivity=read.table("./test/y_test.txt", header = F)
train=read.table("./train/X_train.txt", header=F)
trainActivity=read.table("./train/y_train.txt", header=F)

#Look at the files to make initial assessment, 
#e.g. do they have the same number of columns as the features.txt file says they should have (561)
str(test)  #2947 observations of 561 variables
str(train) #7352 observations of 561 variables.
head(test)
head(train)

#Step 1 of task, Merge the files together
data=rbind(train, test) 
dataActivity=rbind(trainActivity, testActivity) #make sure they are in the same order as the data, train first, then test
colnames(dataActivity) = c("Activity") #give dataActivity column a name.

#perform simple maths on row count, 2947+7352 = 10299, which matches number of rows in the object data

#Step 2 of task, Get the mean and standard deviation
#features.txt tells us that there are multiple mean and sd files
#for each variable captured.  I decided to capture these separately, then combine them.
tBodyAcc=data[,1:6]
tGravityAcc=data[,41:46]
tBodyAccJerk=data[,81:86]
tBodyGyro=data[,121:126]
tBodyGyroJerk=data[,161:166]
tBodyAccMag=data[,201:202]
tGravityAccMag=data[,214:215]
tBodyAccJerkMag=data[,227:228]
tBodyGyroMag=data[,240:241]
tBodyGyroJerkMag=data[,253:254]
fBodyAcc=data[,266:271]
fBodyAccJerk=data[,345:350]
fBodyGyro=data[,424:429]
fBodyAccMag=data[,503:504]
fBodyAccJerkMag=data[,516:517]
fBodyGyroMag=data[,529:530]
fBodyGyroJerkMag=data[,542:543]

#Step 3 rename the dataActivity records to be meaningful. 
dataActivity[which(dataActivity==1, arr.ind=TRUE),1]='WALKING'
dataActivity[which(dataActivity==2, arr.ind=TRUE),1]='WALKING_UPSTAIRS'
dataActivity[which(dataActivity==3, arr.ind=TRUE),1]='WALKING_DOWNSTAIRS'
dataActivity[which(dataActivity==4, arr.ind=TRUE),1]='SITTING'
dataActivity[which(dataActivity==5, arr.ind=TRUE),1]='STANDING'
dataActivity[which(dataActivity==6, arr.ind=TRUE),1]='LAYING'

#Step4 Appropriately labels the data set with descriptive variable names. 
colnames(tBodyAcc) = c("tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ", "tBodyAccSDX", "tBodyAccSDY", "tBodyAccSDZ")
colnames(tGravityAcc) = c("tGravityAccMeanX", "tGravityAccMeanY", "tGravityAccMeanZ", "tGravityAccSDX", "tGravityAccSDY", "tGravityAccSDZ")
colnames(tBodyAccJerk) = c("tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tGravityAccMeanZ", "tBodyAccJerkSDX", "tBodyAccJerkSDY", "tBodyAccJerkSDZ")
colnames(tBodyGyro) = c("tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ", "tBodyGyroSDX", "tBodyGyroSDY", "tBodyGyroSDZ")
colnames(tBodyGyroJerk) = c("tBodyGyroJerkMeanX", "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkSDX", "tBodyGyroJerkSDY", "tBodyGyroJerkSDZ")
colnames(tBodyAccMag) = c("tBodyAccMagMean", "tBodyAccMagSD")
colnames(tGravityAccMag) = c("tGravityAccMagMean", "tGravityAccMagSD")
colnames(tBodyAccJerkMag) = c("tBodyAccJerkMagMean", "tBodyAccJerkMagSD")
colnames(tBodyGyroMag) = c("tBodyGyroMagMean", "tBodyGyroMagSD")
colnames(tBodyGyroJerkMag) = c("tBodyGyroJerkMagMean", "tBodyGyroJerkMagSD")
colnames(fBodyAcc) = c("fBodyAccMeanX", "fBodyAccMeanY", "fBodyAccMeanZ", "fBodyAccSDX", "fBodyAccSDY", "fBodyAccSDZ")
colnames(fBodyAccJerk) = c("fBodyAccJerkMeanX", "fBodyAccJerkMeanY", "fGravityAccMeanZ", "fBodyAccJerkSDX", "fBodyAccJerkSDY", "fBodyAccJerkSDZ")
colnames(fBodyGyro) = c("fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ", "fBodyGyroSDX", "fBodyGyroSDY", "fBodyGyroSDZ")
colnames(fBodyAccMag) = c("fBodyAccMagMean", "fBodyAccMagSD")
colnames(fBodyAccJerkMag) = c("fBodyAccJerkMagMean", "fBodyAccJerkMagSD")
colnames(fBodyGyroMag) = c("fBodyGyroMagMean", "fBodyGyroMagSD")
colnames(fBodyGyroJerkMag) = c("fBodyGyroJerkMagMean", "fBodyGyroJerkMagSD")

#combine all the above columns into one file
combinedData=cbind(tBodyAcc,tGravityAcc,tBodyAccJerk,tBodyGyro,tBodyGyroJerk,tBodyAccMag,
                   tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,
                   fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyAccJerkMag, 
                   fBodyGyroMag, fBodyGyroJerkMag)
##Step 3, Use descriptive activity names to name the activities in the data set
#add Activity column
combinedData=cbind(dataActivity, combinedData)

#Step 5 Create the output
write.table(combinedData, "output.txt", row.name=FALSE)