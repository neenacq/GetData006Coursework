==========================================================================
Title:  Courera.org Course Project
Description:  Collect, work with and clean a data set from a smartphone capturing six activities. 
Date:  August 2014
Author:  Neena Davies
Purpose:  Describes the variables, the data and any transformations or work that was performed to clean up the data.
==========================================================================

For the purpose of this exercise a sub-set of data was required from 
the smartphone/health study.  The requirement was for mean and sd info only.

From the fixtures.
17 variables were identified as part of the study.  Each variable had a mean and std calculated, in some variables there was an X, Y, Z value for each mean and std.  

The 17 variables are
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

This task required Extract the mean and std for each variable.  Where the varaiable name had -XYZ there were three different rows corresponding to X, Y or Z, e.g.
e.g. tBodyAcc-XYZ
tBodyAcc-mean()-X   maps to     tBodyAccMeanX
tBodyAcc-mean()-Y   maps to     tBodyAccMeanY
tBodyAcc-mean()-Z   maps to     tBodyAccMeanZ
tBodyAcc-std()-X    maps to     tBodyAccSDX
tBodyAcc-std()-Y    maps to     tBodyAccSDY
tBodyAcc-std()-Z    maps to     tBodyAccSDZ

Each column was mapped as discussed above.  No data was changed related to the calculations.

===================================================================
Measurement
t denotes time which was captured at a constant rate of 50Hz
f refers to the calculations where Fast Fourier Transform was applied.

The explanatoin from the features_info.txt file is as follows 

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)"

=================================================================
The activities were a numbered data set which corresponded as follows:
# Activity
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
The first column of the final file the Activity is named rather than the number


