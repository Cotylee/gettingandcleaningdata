---
output: html_document
---
title: "code book"
author: "Coty Webb"
date: "March 22, 2016"
output: html_document

The code executed by the run_analysis.R script does many things, it is annotated with in the code for clarity.
The code first checks to make sure the data is loaded in the working directory  if not it will download it from the internet. Next the code extracts subject, x and y data then merges test and train data. It than renames variable to their descriptive names found in the features file. Next it finishes renaming the columns by descriptively the subject and activity names, It subsets the data taking only variables of interest. The code cleans up the column names and makes them more readable by removing extra characters and bettering abbreviations. Finally the compiles a tidy data set ready for downstream processing.

The subjects are identified by number. Subject is used as an ID variable as is Activity


ID Variables

* "Subject"
* "Activity"

Measurement Variables

* "tBodyAcc Mean  X"
* "tBodyAcc Mean  Y"
* "tBodyAcc Mean  Z"
* "tBodyAcc StanDev  X"
* "tBodyAcc StanDev  Y"
* "tBodyAcc StanDev  Z"
* "tGravityAcc Mean  X"
* "tGravityAcc Mean  Y"
* "tGravityAcc Mean  Z"
*  "tGravityAcc StanDev  X"
* "tGravityAcc StanDev  Y"
* "tGravityAcc StanDev  Z"
* "tBodyAccJerk Mean  X"
* "tBodyAccJerk Mean  Y"
* "tBodyAccJerk Mean  Z"
* "tBodyAccJerk StanDev  X"
* "tBodyAccJerk StanDev  Y"
* "tBodyAccJerk StanDev  Z"
* "tBodyGyro Mean  X"
* "tBodyGyro Mean  Y"
* "tBodyGyro Mean  Z"
* "tBodyGyro StanDev  X"
* "tBodyGyro StanDev  Y"
* "tBodyGyro StanDev  Z"
* "tBodyGyroJerk Mean  X"
* "tBodyGyroJerk Mean  Y"
* "tBodyGyroJerk Mean  Z"
* "tBodyGyroJerk StanDev  X"
* "tBodyGyroJerk StanDev  Y"
* "tBodyGyroJerk StanDev  Z"
* "tBodyAccMag Mean "
* "tBodyAccMag StanDev "
* "tGravityAccMag Mean "
* "tGravityAccMag StanDev "
* "tBodyAccJerkMag Mean "
* "tBodyAccJerkMag StanDev "
* "tBodyGyroMag Mean "
* "tBodyGyroMag StanDev "
* "tBodyGyroJerkMag Mean "
* "tBodyGyroJerkMag StanDev "
* "fBodyAcc Mean  X"
* "fBodyAcc Mean  Y"
* "fBodyAcc Mean  Z"
* "fBodyAcc StanDev  X"
* "fBodyAcc StanDev  Y"
* "fBodyAcc StanDev  Z"
* "fBodyAcc Mean Freq X"
* "fBodyAcc Mean Freq Y"
* "fBodyAcc Mean Freq Z"
* "fBodyAccJerk Mean  X"
* "fBodyAccJerk Mean  Y"
* "fBodyAccJerk Mean  Z"
* "fBodyAccJerk StanDev  X"
* "fBodyAccJerk StanDev  Y"
* "fBodyAccJerk StanDev  Z"
* "fBodyAccJerk Mean Freq X"
* "fBodyAccJerk Mean Freq Y"
* "fBodyAccJerk Mean Freq Z"
* "fBodyGyro Mean  X"
* "fBodyGyro Mean  Y"
* "fBodyGyro Mean  Z"
* "fBodyGyro StanDev  X"
* "fBodyGyro StanDev  Y"
* "fBodyGyro StanDev  Z"
* "fBodyGyro Mean Freq X"
* "fBodyGyro Mean Freq Y"
* "fBodyGyro Mean Freq Z"
* "fBodyAccMag Mean "
* "fBodyAccMag StanDev "
* "fBodyAccMag Mean Freq"
* "fBodyBodyAccJerkMag Mean "
* "fBodyBodyAccJerkMag StanDev "
* "fBodyBodyAccJerkMag Mean Freq"
* "fBodyBodyGyroMag Mean "
* "fBodyBodyGyroMag StanDev "
* "fBodyBodyGyroMag Mean Freq"
* "fBodyBodyGyroJerkMag Mean "
* "fBodyBodyGyroJerkMag StanDev "
* "fBodyBodyGyroJerkMag Mean Freq"

The Activity variable describes the activity being measured as proformed by each subject
and takes values of:

* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

