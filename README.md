# *Getting and Cleaning Data* course project


In this project, the Samsung Galaxy S smartphone was used to collect data from its accelerometer and gyroscope. The data collected was cleaned and a tidy data was created for further investigation

This repository contains the following files:

- `README.md`, this file, which provides an overview of the data set and how it was created.
- `CodeBook.md`, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
- `run_analysis.R`, the R script that was used to clean the data set 
- `Tidy.txt`, which contains the tidy data set.


## Creating the data set
It is assumed that the data set has been downloaded and extracted into the working directory

The R script `run_analysis.R` was used to create the tidy data set. It transforms the source data set to produce the final tidy data set by using the following steps (see the Code book for details, as well as the comments in the script itself):

- Read data.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `tidy_data.txt` file.


This script requires the `dplyr` and `read.table `packages.
The output was generated by running script on  R version 4.0.0 (2020-04-24) 