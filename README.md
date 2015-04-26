# Getting-Cleaning-Data: Course Project

## 1. Merges the training and the test sets to create one data set:

First, we collect all the data from the folder corresponding to x(observations), y(activity) and the subjects and put them into these files:
x_train
x_test
y_train
y_test
subject_train
subject_test

After we combine the observations by rows to get the files:
x
y
subject

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:

Then from the data features and the function grep, we can select the features related to mean and standard deviation. 
Finally, x is reduced by taking into account only the desired columns.

## 3. Uses descriptive activity names to name the activities in the data set:

We first get the activity labels and transform y which initially contains integer to a vector explaining the activities literally.

## 4. Appropriately labels the data set with descriptive activity names:

We just give names to the column Activity and Subject

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:

We export the result in a text file through the command write.table()




