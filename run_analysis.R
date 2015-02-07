# Set the working directory and create folder for the Samsung data

setwd("C:/Users/Helen/Desktop/Getting_Clean_Data")
if (!file.exists("data")) {
     dir.create("data")
}

# Download and unzip the data files

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Datafiles.zip")
dateDownloaded <- date()
dateDownloaded
unzip("./data/Datafiles.zip", exdir = "./data")
file.remove("./data/Datafiles.zip")
rm(fileUrl)

# Read the relevant text files into R

setwd("./data/UCI HAR Dataset")
activity_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
setwd("../../")

# Task 1
# a) Merge the data to create 2 labeled datasets for the training and test cases

train <- cbind(subject_train, y_train, x_train)
rm(x_train, y_train, subject_train)
test <- cbind(subject_test, y_test, x_test)
rm(x_test, y_test, subject_test)

# b) Merge the train and test datasets

DataFrame <- rbind(test, train)
rm(test, train)

# Task 2: Extract variables that measure mean and standard deviation 

RelVars <- grepl("mean|std", features$V2)
RelVarsAll <- c(TRUE, TRUE, RelVars)
DataFrame <- DataFrame[ , RelVarsAll]
rm(RelVarsAll)

# Task 3: Replace activity numbers with descriptive names

activity_labels <- transform(activity_labels, V2 = sub("LAYING", "LYING", V2))
library(dplyr)
for (i in 1:6){
     DataFrame <- transform(DataFrame, V1.1 = sub(i, activity_labels[i,2], V1.1))
     }
rm(i, activity_labels)

# Task 4: Label the dataset with descriptive variable names

FeatureNames <- as.character(features[RelVars,2])
FeatureNames <- sub("\\(\\)", "", FeatureNames)
FeatureNames <- gsub("-", "", FeatureNames)
FeatureNames <- sub("mean", "Mean", FeatureNames)
FeatureNames <- sub("std", "Std", FeatureNames)
FeatureNames <- sub("BodyBody", "Body", FeatureNames)

AllVarNames <- c("subject", "activity", FeatureNames)
names(DataFrame) <- AllVarNames
rm(objects = features, RelVars, FeatureNames, AllVarNames)

# Task 5: Create new dataset with variable averages for each subject & activity

SubjectActivity <- group_by(DataFrame, subject, activity)
Averages <- summarise_each(SubjectActivity, funs(mean))
rm(SubjectActivity)
View(Averages)