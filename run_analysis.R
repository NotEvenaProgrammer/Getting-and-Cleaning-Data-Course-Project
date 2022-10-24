# For  this project we consider you already have the data unpacked in the 
# working directory

# 0. Loading required libraries
library(dplyr)

# 1. Merges the training and the test sets to create one data set.

#Reading files
# test data
subject_test <- read.table("test/subject_test.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
# training data
subject_train <- read.table("train/subject_train.txt", header = FALSE)
X_train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
# Merging all data in one data set
dataSubject <- rbind(subject_test,subject_train)
dataX <- rbind(X_test, X_train)
datay <- rbind(y_test,y_train)

allData <- cbind(dataSubject, datay, dataX)

# 2. Extracts only the measurements on the mean and standard deviation for 
# each measurement. 

# set column names before filtering the data
features <- read.table("features.txt") 
names(allData) <- c("Subject", "Activity", as.character(features$V2))
# getting only the column with mean or std
neededColumns <- grep("Subject|Activity|[Mm]ean|std", names(allData))

neededData <- allData[,neededColumns]

# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt", header = FALSE)
neededData$Activity <- activities[neededData$Activity,2]

# 4. Appropriately labels the data set with descriptive variable names. 
names(neededData)<-gsub("^t", "time", names(neededData))
names(neededData)<-gsub("^f", "frequency", names(neededData))
names(neededData)<-gsub("Acc", "Accelerometer", names(neededData))
names(neededData)<-gsub("Gyro", "Gyroscope", names(neededData))
names(neededData)<-gsub("Mag", "Magnitude", names(neededData))
names(neededData)<-gsub("BodyBody", "Body", names(neededData))

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidyData <- neededData %>%
    group_by(Subject, Activity) %>%
    summarise_all(mean)
write.table(tidyData, "tidyData.txt", row.name=FALSE)
