#######################################################
# 1. Merges the training and the test sets to create one data set.
#######################################################

# Read column names from features.txt
feature_names <- readLines("UCI HAR Dataset/features.txt")
feature_names <- sub("\\d+\\s+", "", feature_names)
col_names <- c("subject", "activity", feature_names)

# Read training set
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- as.numeric(readLines("UCI HAR Dataset/train/y_train.txt"))
subject_train <- as.numeric(readLines("UCI HAR Dataset/train/subject_train.txt"))
data_train <- cbind(subject_train, y_train, X_train)
names(data_train) <- col_names

# Read test set
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- as.numeric(readLines("UCI HAR Dataset/test/y_test.txt"))
subject_test <- as.numeric(readLines("UCI HAR Dataset/test/subject_test.txt"))
data_test <- cbind(subject_test, y_test, X_test)
names(data_test) <- col_names

# Merge training and test sets
data <- rbind(data_train, data_test)

#######################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#######################################################

# Extract the columns we are interested in
relevant_indices <- grep("mean\\(\\)|std\\(\\)|^subject$|^activity$", names(data))
data <- data[, relevant_indices]

#######################################################
# 3. Uses descriptive activity names to name the activities in the data set
#######################################################

# Swap numbers to activity labels
activity_labels <- readLines("UCI HAR Dataset/activity_labels.txt")
activity_labels <- sub("\\d+\\s+", "", activity_labels)
data[, "activity"] <- factor(activity_labels[data[, "activity"]], levels = activity_labels)

#######################################################
# 4. Appropriately labels the data set with descriptive variable names.
#######################################################

# The data set already has descriptive column names from step 1,
# but they can be cleaned up a bit
names(data) <- sub("mean\\(\\)", "Mean", names(data))
names(data) <- sub("std\\(\\)", "Std", names(data))
names(data) <- gsub("-", "", names(data))

#######################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.
#######################################################

# Group by subject and activity, compute means of the other columns
tidy <- aggregate(data[,3:ncol(data)], data[,1:2], FUN = mean)
write.table(tidy, "tidy.txt", row.names = FALSE)
