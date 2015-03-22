## Script for analysis of Smartphone Data on Human Activity
## 

PathToFiles <- "./UCI HAR Dataset/"
## Download the data set and unzip it if it does not exist yet
## Assume this has been done manually

## Read the activity_lables, list of features
activ <- read.table(file=paste(PathToFiles,"activity_labels.txt",sep=""))
names(activ) <- c("code","activity")
feat <- read.table(file=paste(PathToFiles,"features.txt",sep=""))
namefeat <- as.character(feat$V2)       
selectfeat <- c(namefeat[grep("mean()",namefeat,fixed=TRUE)],
                namefeat[grep("std()",namefeat,fixed=TRUE)])
        ## select the names in the feature list that contain 
        ## "mean()" and "std()", for use of extractiong the corresponding 
        ## variables


## Read the training data, activity labels, subject_info and combine in a clean
## data set
dat <- read.table(file=paste(PathToFiles,"train/X_train.txt",sep=""))
names(dat) <- namefeat ## change to meaningful variable names
lab <- read.table(file=paste(PathToFiles,"train/y_train.txt",sep=""))
names(lab) <- "ActivityCode" ## change to meaningful variable name
act <- data.frame( ActivityName = as.character(
                activ$activity[match(lab$ActivityCode,activ$code)] 
                ) ) ## match activity codes with corresponding activity names
sub <- read.table(file=paste(PathToFiles,"train/subject_train.txt",sep=""))
names(sub) <- "SubjectID" ## change to meaningful variable name
train <- cbind(sub, lab, act, dat[selectfeat])      
        ## a clean version of the train data, with only the mean and std columns

## Read the test data, activity labels, subject_info and combine in a clean
## data set
dat <- read.table(file=paste(PathToFiles,"test/X_test.txt",sep=""))
names(dat) <- namefeat ## change to meaningful variable names
lab <- read.table(file=paste(PathToFiles,"test/y_test.txt",sep=""))
names(lab) <- "ActivityCode" ## change to meaningful variable name
act <- data.frame( ActivityName = as.character(
                activ$activity[match(lab$ActivityCode,activ$code)] 
                ) ) ## match activity codes with corresponding activity names
sub <- read.table(file=paste(PathToFiles,"test/subject_test.txt",sep=""))
names(sub) <- "SubjectID" ## change to meaningful variable name
test <- cbind(sub, lab, act, dat[selectfeat])       
        ## a clean version of the test data, with only the mean and std columns

## Merge training and test data by row binding (as the structure is the same
## in both data frames)

datdf <- rbind(train,test)

## Now split the data to provide averages for each subject and activty
s <- split(datdf,interaction(as.factor(datdf$SubjectID),datdf$ActivityName))
res <- sapply(s, function(x) colMeans(x[,-3]))
## Create a new data frame with the names of the factors used for analysis
IDActivity <- data.frame(ID.Activity=colnames(res))
res <- as.data.frame(t(res))
act <- data.frame( ActivityName = as.character(
        activ$activity[match(res$ActivityCode,activ$code)]
        ) ) ## match activity codes with corresponding activity names

## Assemble a data frame from the analysis results and addtional informative
## variables
output <- cbind(IDActivity,act,res)

## write table of computed means for each subject and activity
write.table(output, file="ID_Activity_summary.txt",row.names=FALSE)