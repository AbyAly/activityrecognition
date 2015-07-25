#First step
#Ensure your working directory is the same where data is
#Merging of the two data sets will be done by below R instructions

library(plyr)

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Combining x variables from the test and train data
x_data <- rbind(x_train, x_test)

#Combining y variables from the test and train data
y_data <- rbind(y_train, y_test)

#Combining subject variables from the test and train data
subject_data <- rbind(subject_train, subject_test)

#View the above merged data sets to make sure they are combined correctly 


#Second step
#To extract the MEAN and SD variables for each measurement

features <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[ ,2])

#subsetting the columns we require
x_data <- x_data[, mean_and_std_features]

#Updating the variable names
names(x_data) <- features[mean_and_std_features, 2]

#Third Step
#To use descriptive names for activities

activities <- read.table("activity_labels.txt")
y_data[,1] <- activities[y_data[,1],2]
names(y_data) <- "activity"
 
#Fourth Step
#Data set labeling

#labeling column name
names(subject_data) <- "subject"

#Combining all data in one set
all_data <- cbind(x_data, y_data, subject_data)


#Fifth step
#To create tidy data with averages

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[,1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
