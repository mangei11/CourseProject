## Data clean up of Human Activity Recognition Using Smartphone Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for this project was downloaded on 2015-03-01 17:44 PCT from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

and unziped into a subfolder "./UCI HAR Dataset/" within the working directory. 
The R script run_analysis.R extracts data files from this directory and 2 subfolders train and test. The files being read are:
activity_labels.txt
features.txt
train/X_train.txt
train/y_train.txt
train/subject_train.txt
test/X_test.txt
test/y_test.txt
test/subject_test.txt

The R script "run_analysis.R" does the following: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Execution of "run_analysis.R" in the working directory performs all analysis required in this project.

The output file "ID_Activity_summary.txt" is produced. It contains the average values of the variables identified as mean() and std(), for each activity and each subject. For the 30 subjects in this study and the 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) were analysed, such that the number of rows in "ID_Activity_summary.txt" equals to 180. The columns correspond to (ID.Activity, ActivityName, SubjectID, ActivityCode, tBodyAcc-mean()-X, ... where  the rest of the remaining columns is labeled according to the labels from the raw data (which are self-explanatory and descriptive) as explained in "features_info.txt" of the downloaded data.

For additional information on variables see "Codebook.md"
