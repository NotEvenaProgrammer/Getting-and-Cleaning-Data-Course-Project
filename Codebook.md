# Getting and Cleaning Data Course Project Codebook

## Project Considerations
1. Library dplyr is installed in your equip
2. Data from [here]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been downloaded and unpacked in your working directory.
3. The information in the test/Inertial Signals and train/Inertial Signals folders were not cosidered in this project.

## Data information
With regards to the data we considered the following:
1. "Y_train.txt" and "Y_test.txt" files contain information about the activity performed.
2. "subject_train.txt and "subject_test.txt" files contain information about which person performed which activity.
3. "X_train.txt" and "X_test.txt" files contain information about the feature vector for each activity.
4. "feature.txt" contains the name of each measurement in the feature vector.
5. "activity_labels.txt" contains the description of each activity.

## Data manipulation
1. As first step data was merged from train and test datasets individually(subject_train, activity and feature vector).
2. Second data was merged all information in the "allData" dataset. For each observation we have the following information: subject, activity and feature vector.
3. Then we add names to the "allData" dataset in order to extract only the information related to mean and standard deviation. The filter considered the words (Mean, mean and std). The information was stored in the "neededData".
4. Afterwards the names corresponding to the featured vector were modified to give them a more human readable name (i.e. "Acc" was replaced with "Accelerometer", "Gyro" was replaced with "Gyroscope", etc.).
5. Finally we get the average of each variable for each activity and each subject in order to obtain the "tidyData" dataset which was stored in the file "tidyData.txt"

