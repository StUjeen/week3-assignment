# Purpose of this document
Hereunder the code parameters are described step by step of proceeding the data

# Data proceeding
to compleate transformation next libraries are needed:
library(dplyr)
library(reshape2)
### 1. Load the datasets to working directory
set "../UCI HAR Dataset" as working directory and put unzipped files in there
setwd("C:/uci har dataset/")
drs <- get file names from working directory
### 2. Read X_test.txt and X_train.txt files to make a single dataset with 561 variables (listed in features.txt)
### 2.1 Define files to be read
flist <- get paths for X dtasets
### 2.2 Read features.txt file to get and assigne variable names to dataset variables
varnames <- read features.txt file
### 2.3 Read X datasets
wdth <- set a width for each of 561 variables
dset <- read X files to a list of datasets
dset2 <- bind X datasets to a single dataset by rows "rbind()"
### 3. Read subject_train.txt, subject_test.txt, y_train.txt and y_test.txt files to make a single dataset with 2 variables ("subject" and "label")
flist1 <- get paths for subject and lable dtasets
dset <- read subjects and lables files to a list of datasets
dset3 <- bind X datasets to a single dataset by rows "rbind()"
### 4. Join two datasets from 2 and 3 to a single dataset (bind by cols)
dset <- bind X and subject\label datasets to a single dataframe by cols "cbind()"
### 5. Substitute label numbers with activitiy names from activity_labels.txt
activity <- read activity_labels.txt file content
### 6. Select the only means and standard deviations columns from the dataset
varnames <- create a vector of names to be extracted from dset
dset1 <- extract subject, label_name, mean and std columns of dset
dset1 <- merge the dset1 with activity labels (activity)

# Data tyding
### 7. Melt dataset to a long format table with keys "subject", "label_name" and with variable for each key entry. Varable column includes column names from the dataset
dset3 <- coerce the dset1 to a dataframe table
dset_m <- melt dset3 with key columns subject and label_names, melting of 561 variables to a long format table

# Prepare the data for analysis
### 8. Group the dataset firstly by subject then by activity name (label_name) and finaly by variable
dset_gb <- group the dset_m by subject firstly, then by label_name and finally by variable
### 9. Aggregate the dataset by mean value of each variable per a subject's activities
dset_res <- calculate mean value of each variable per subject's activities
### 10. Create a txt file with resulting dataset

The end.
