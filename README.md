# PROJECT: Peer-graded Assignment: Getting and Cleaning Data Course Project
The Project goal is to structure raw data, calculate means and standard deviation for set of variables and present the results in tidy way. For purpuse the project to be done was used RStudio 1.0.143, Windows 10, Intel(R) Core(TM) Duo i7-5500U CPU 2.40 GHz, 8.00 GB

# Introduction
This file describes the data to be proceeded within the project.

# Activities to work with datasets
1. Create one R script called run_analysis.R that does the following.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data
## domain description
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## SOURCES
### full data and description
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### data for project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

this link above includes set of files which represents raw data to be prepeared for analysis.

## PATHS
[1] ".."                                       
[2] "../UCI HAR Dataset"                       
[3] "../UCI HAR Dataset/test"                  
[4] "../UCI HAR Dataset/test/Inertial Signals" 
[5] "../UCI HAR Dataset/train"                 
[6] "../UCI HAR Dataset/train/Inertial Signals"

for purpose of this project datasets [4] and [6] are not used.
the datasets represented as a set of txt files:

[1] "../UCI HAR Dataset/activity_labels.txt"     - Links the class labels with their activity name                      
[2] "../UCI HAR Dataset/features.txt"            - List of all features used to describe datasets of X_test and X_train                   
[3] "../UCI HAR Dataset/test/X_test.txt"         - Test data splitted by subjects and activities for each variable listed in [2]                  
[4] "../UCI HAR Dataset/test/subject_test.txt    - Includes values of subjects whos measurements shown in [3]                  
[5] "../UCI HAR Dataset/test/y_test.txt"         - Includes value of activity for each measurement line of [3]                  
[6] "../UCI HAR Dataset/train/X_train.txt"       - Experimental data of measurements splitted by subjects and activities for each variable listed in [2]                  
[7] "../UCI HAR Dataset/train/subject_train.txt" - Includes values of subjects whos measurements shown in [6]                  
[8] "../UCI HAR Dataset/train/y_train.txt"       - Includes value of activity for each measurement line of [3]                  

additional files:                  
[9] "../UCI HAR Dataset/features_info.txt" - description of the [2] content                  
[10] "../UCI HAR Dataset/README.txt" - description of other datasets content

## DATA TYPES

### X_test and X_train
data format: fixed width format                  
number of variables: 561                  
column types: all data types for each variable is an positive or negative integer                  
column width: 16 symbols                   
dim(X_test): 2948 x 561                  
dim(X_train): 7353 x 561                  

### subject_test and subject_train
data format: fixed width format                  
number of variables: 1                  
column types: all data types for each variable is an numeric                  
column width: 2 symbols                   
dim(subject_test): 2948 x 1                  
dim(subject_train): 7353 x 1                  

### y_test and y_train
data format: fixed width format                  
number of variables: 1                  
column types: all data types for each variable is an numeric                  
column width: 1 symbol                  
dim(y_test): 2948 x 1                  
dim(y_train): 7353 x 1                  

### activity_labels
data format: table in a text file                  
number of variables: 2                  
column types:                   
  var1: numeric                  
  var2: string                  
column width:                   
  var1: 1 symbols                  
  var2: 18 symbols                  
separator: " " (single space)                  
dim(activity_labels): 6 x 2                  

### features
data format: table in a text file                  
number of variables: 2                  
column types:                   
  var1: numeric                  
  var2: string                  
column width:                   
  var1: from 1 to 3 symbols                  
  var2: up to 36 symbols                  
separator: " " (single space)                  
dim(features): 561 x 2                  
