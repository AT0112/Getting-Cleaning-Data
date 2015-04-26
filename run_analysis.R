
## 1. Merges the training and the test sets to create one data set:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c('feature_ID', 'Feature_Name')
index_features <- grep("mean|std", features$Feature_Name)
x <- x[, index_features] 
names(x) <- features[index_features, 2]

## 3. Uses descriptive activity names to name the activities in the data set:
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities) <- c('Activity ID', 'Activity Name')
y[, 1] = activities[y[, 1], 2]

## 4. Appropriately labels the data set with descriptive activity names:
names(y) <- "Activity"
names(subject) <- "Subject"
tidyDataSet <- cbind(s, y, x)

## 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
toAggreg <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyDataMEANSet <- aggregate(toAggreg,list(tidyDataSet$Subject, tidyDataSet$Activity), mean)
names(tidyDataMEANSet)[1] <- "Subject"
names(tidyDataMEANSet)[2] <- "Activity"
#Export
tidyDataFileMEANtxt <- "./UCI-HAR-dataset-STEP5.txt"
write.table(tidyDataMEANSet, tidyDataFileMEANtxt, row.name=FALSE)
