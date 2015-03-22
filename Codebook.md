## Codebook
In addition to the variable names of the original data (see below for an extract of relevant information for the new, tidy data set produced by "run_analysis.R") the following new variables were introduced:

ID.Activity:	Factor 
				180 levels indicating Subject ID and Activity, e.g. "2.WALKING" means subject 2 during activity "WALKING"
				
ActivityName:	Factor
				6 levels (according to activity_labels.txt from the original data):
				WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
				
SubjectID:		Integer 
				1,..., 30, corresponding to the code given in "subject_test.txt" and "subject_train.txt

ActivityCode: 	Integer
				1,..., 6, corresponding to the code given in "activity_labels.txt"


For the remaining variables see "features_info.txt":
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For analysis with "run_analysis.R" the reduced set of variables that were estimated from these signals is: 

mean(): Mean value
std(): Standard deviation

The data in the output file are average values of the mean() and std() data.
No tranformations were necessary.
No data appeared to be missing data.
