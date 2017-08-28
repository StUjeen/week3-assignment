# Purpose of this document
Hereunder the algorithm to proceeed data is described step by step

# Data proceeding
to compleate transformation next libraries are needed:
library(dplyr)
library(reshape2)

### 1. Load the datasets to working directory
set "../UCI HAR Dataset" as working directory and put unzipped files in there
setwd("C:/uci har dataset/")
"drs" <- get file names from working directory

### 2. Read X_test.txt and X_train.txt files to make a single dataset with 561 variables (listed in features.txt)
flist <- get paths for X dtasets

### 2.1 Read features.txt file to get and assigne variable names to dataset variables

### 3. Read subject_train.txt, subject_test.txt, y_train.txt and y_test.txt files to make a single dataset with 2 variables ("subject" and "label")

### 4. Join two datasets from 2 and 3 to a single dataset (bind by cols)

### 5. Substitute label numbers with activitiy names from activity_labels.txt

### 6. Select the only means and standard deviations columns from the dataset

# Data tyding

### 7. Melt dataset to a long format table with keys "subject", "label_name" and with variable for each key entry. Varable column includes column names from the dataset

# Prepare the data for analysis

### 8. Group the dataset firstly by subject then by activity name (label_name) and finaly by variable

### 9. Aggregate the dataset by mean value of each variable per a subject's activities
