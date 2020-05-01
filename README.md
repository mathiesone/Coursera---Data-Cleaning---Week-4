# Coursera---Data-Cleaning---Week-4
Coursera - Data Cleaning - Week 4 - Final course submission

Data has been collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available from the site that the data was taken:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Print this independent tidy data to a text file in your working directory.

Please note:  The comments within the R script should help understand which areas are being accomplished at each stage.

When running this R Script, the script will re-download the data to the working directory (this is currently hard coded, and will require updating to your own wd - see line 6).
The script will create a folder "data" for this download, then open the zip to your main working directory and continue all actions from here.
