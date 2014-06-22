# where are the data? Set the working directory if and as required
#setwd("~/Course_Project/")

# import test data
test.sub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject" )
test.y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Class")
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")

# import train data
train.sub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject" )
train.y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Class")
train.x <- read.table("UCI HAR Dataset/train/X_train.txt")

# import variable names -- keep only strings (2nd column)
features <- read.table ( "UCI HAR Dataset/features.txt" , col.names = c ( "Column", "Description"), stringsAsFactors=FALSE )[,2]

# somehow clean up variable names
features <- gsub ( "\\()", "", gsub( "^t", "Time-", gsub ( "^f", "Frequency-", gsub ( "\\(t", "(Time-", gsub("\\),", ",", gsub("(?<=\\d),(?=\\d)", ":",features, perl = TRUE) ) ) ) ) )

# feed variable names to data sets
colnames(test.x) <- features
colnames(train.x) <- features

# bind data and activity class numbers/labels
test <- cbind (test.sub, test.y, test.x)
train <- cbind (train.sub, train.y, train.x)

# bind train and test data in one
data <- rbind (train, test)

# activities: class numbers and labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c ("Class", "Label") )
data$Activity <- labels$Label[match(data$Class,labels$Class)]
data <- data[c(1:2,564,3:563)] # re-order columns to have Activity in "front"

# extract columns which contain mean and std values -- ignore letter case
measures.mean.index <- grep ( "mean", colnames(data), ignore.case = TRUE )
measures.std.index <- grep ( "std", colnames(data), ignore.case = TRUE)
data.sub <- data[ c ( 1:3, measures.mean.index, measures.std.index ) ]

# reshape2
library (reshape2)

# melt data set
data.sub.melt <- melt(data.sub, id = c ("Subject", "Class", "Activity") , measure.vars = c(4:89), variable.name = "Features", value.name = "Signals" )

# dcast by Subject & Activity, drop "Class", derive mean for Signals & adjust variable names appropriately
data.sub.tidy <- dcast (data.sub.melt, Subject + Activity ~ Features, mean, value.var = "Signals")
features.tidy <- c ("Subject", "Activity", paste ( "Mean of", colnames(data.sub.tidy[,3:88]) ) )
colnames(data.sub.tidy) <- features.tidy