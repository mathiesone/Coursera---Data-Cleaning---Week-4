
library(data.table)
library(dplyr)

## set working directory
setwd("C:/Users/emily/OneDrive/Documents/RStudio/Data Cleaning - Week 4/Coursera---Data-Cleaning---Week-4")

## Set file URL
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## if a data folder does not exist, create one
if(!file.exists("./data")){dir.create("./data")}

## download and open file
download.file(fileURL, "./data/UCI_HAR_Dataset.zip")
unzip("./data/UCI_HAR_Dataset.zip")



## download activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activitynumber", "activity")

## download features labels
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(features) <- c("featurenumber", "feature")



## download x files
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")

## download y files
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## download subject files
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")



## combine files
x_combined <- rbind(x_test, x_train)

y_combined <- rbind(y_test, y_train)
## rename y table columns for activities.
colnames(y_combined) <- c("activitynumber")

subject_combined <- rbind(subject_test, subject_train)
## rename subject table columns
colnames(subject_combined) <- c("Subject")



## Question 3
## starting to sort the activity label naming
## merge activity table (y) and the labels provided
activity <- merge(y_combined, activity_labels, "activitynumber")



## rename columns in "x" table - features
colnames(x_combined) <- features$feature



## Question 1 & 3
## combine all data and re-do activity labels to be more descriptive.
data_combined <- cbind(subject_combined, "Activity" = activity$activity, x_combined)

data_combined <- data_combined[order(data_combined$subjectnumber, data_combined$activity),]


## Question 2
## finding the mean and standard deviation columns
features_mean_sd <- features$feature[grep("mean|std", features$feature)]
data_mean_sd <- data_combined[c("Subject", "Activity", as.character(features_mean_sd))]



## Question 4
## renaming feature headers to be easier to read
names(data_mean_sd) <- gsub("^t", "Time", names(data_mean_sd))
names(data_mean_sd) <- gsub("^f", "Frequency", names(data_mean_sd))
names(data_mean_sd) <- gsub("Acc", "Accelerometer", names(data_mean_sd))
names(data_mean_sd) <- gsub("Gyro", "Gyroscope", names(data_mean_sd))
names(data_mean_sd) <- gsub("BodyBody", "Body", names(data_mean_sd))
names(data_mean_sd) <- gsub("Mag", "Magnitude", names(data_mean_sd))



## Question 5
## summary of data, unique Subject/Activity combination, mean of all other data.
data_summary <- aggregate(. ~ Subject + Activity, data = data_mean_sd, mean)
data_summary <- data_summary[order(data_summary$Subject, data_summary$Activity),]

