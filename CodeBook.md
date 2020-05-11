CodeBook
---------------------------------------------------------------
This document describes the conversion of the downloaded data set to a tidy dataset "Tidy.txt" using "run_analysis.R"

##Dataset Used

The data set was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 

## Data Set

-- `activity_labels.txt` has metadata on the different types of activities.
-- `features.txt` has the name of all the features.
-- `X_train.txt` has the training data of the features.
-- `y_train.txt` has the activities for the `X_train.txt`.
-- `subject_train.txt` has training information about the subjects of the data
-- `X_test.txt` has the testing data of the features.
-- `y_test.txt` has the activities for the `X_test.txt`
-- `subject_test.txt` has testing information about the subjects of the data


##Transformations

 Transformations performed on the input dataset:
 
-- `features.txt` is read into `features`.
-- `activity_labels.txt` is read into `activityLabels`. 
-- `X_train.txt` is read into `X_Train`.
-- `y_train.txt` is read into `Y_Train`.
-- `subject_train.txt` is read into `subjectTrain`.
-- `X_test.txt` is read into `X_Test`.
-- `y_test.txt` is read into `Y_Test`.
-- `subject_test.txt` is read into `subjectTest`.

-- The trainig and test data of x,y,subject are respectively merged into `X_dat`,`Y_dat`,`subject` 
-- The names of the features from `features` are used as column names for `X_dat`.
-- `X_dat`, `Y_dat` and `subject` are merged to form `comData`.
-- Only the columns that contain std or mean, activity and subject are stored in `comData_mean_std` .
-- `simp_data` is created with data of`comData` using columns from `comData_mean_std`,562 and 563 .
-- `Activity` column in `simp_data` is updated with descriptive names of activities taken from `activityLabels`.          `Activity` column is converted into factor variable.
-- Acronyms of variable names of `simp_data`, like 'Acc', 'Gyro', 'Mag', 't' and 'f' are replaced with descriptive        labels such as 'Acceleration', 'Gyroscpoe', 'Magnitude', 'Time' and 'Frequency'.
-- `tidyData` is created by taking the average of each activity and subject of `simp_data`. `tidyData` is ordered based    on activity and subject.
-- Finally, the data in `tidyData` is written into `Tidy.txt`.

##Output Data Set

The output data `Tidy.txt` is a a space-delimited value file. The first line (header) contains the names of all the variables. It contains the mean and standard deviation values of the data contained in the input files. The header is restructued in an understandable manner. 
