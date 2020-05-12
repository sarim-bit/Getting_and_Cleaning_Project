
library(data.table)
library(dplyr)

#If the files are not downloaded uncomment the codeblock below

# #fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# #download.file(fileUrl,destfile="./DataSet.zip")
#
# #Unzip dataSet to /data directory
# #unzip(zipfile="./Dataset.zip")

# The main program
# Reading the data and storing in table
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
Y_Train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
X_Train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
Y_Test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
X_Test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

#Combining test and train data
subject<-rbind(subjectTrain,subjectTest)
X_dat<-rbind(X_Train,X_Test)
Y_dat<-rbind(Y_Train,Y_Test)

#Naming the columns
colnames(subject)<-"Subject"
colnames(X_dat) <- t(features[2])
colnames(Y_dat) <- "Activity"

# Merging data
comData <- cbind(X_dat,Y_dat,subject)

########################################################################################################################

# Collecting only the mean and std columns
comData_mean_std <- grep(".*Mean.*|.*Std.*", names(comData), ignore.case=TRUE)
simp_data<-comData[,c(comData_mean_std,562,563)]
########################################################################################################################

# Giving descriptive activity names
simp_data$Activity <- as.character(simp_data$Activity)
for(i in 1:6){
  simp_data$Activity[simp_data$Activity==i] <- as.character(activityLabels[i,2])
}
simp_data$Activity <- as.factor(simp_data$Activity)

names(simp_data)<-gsub("^t", "Time", names(simp_data))
names(simp_data)<-gsub("^f", "Frequency", names(simp_data))
names(simp_data)<-gsub("Acc", "Acceleration", names(simp_data))
names(simp_data)<-gsub("Gyro", "Gyroscope", names(simp_data))
names(simp_data)<-gsub("BodyBody", "Body", names(simp_data))
names(simp_data)<-gsub("Mag", "Magnitude", names(simp_data))
names(simp_data)<-gsub("angle", "Angle", names(simp_data))
names(simp_data)<-gsub("gravity", "Gravity", names(simp_data))
names(simp_data)<-gsub("-mean()", "Mean", names(simp_data), ignore.case = TRUE)
names(simp_data)<-gsub("-std()", "STD", names(simp_data), ignore.case = TRUE)
names(simp_data)<-gsub("-freq()", "Frequency", names(simp_data), ignore.case = TRUE)
########################################################################################################################

#Creating a tidy data
simp_data$Subject <- as.factor(simp_data$Subject)
simp_data <- data.table(simp_data)

tidyData <- aggregate(. ~Subject + Activity, simp_data, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt")
