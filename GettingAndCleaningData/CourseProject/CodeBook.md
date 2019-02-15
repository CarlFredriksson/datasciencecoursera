## Feature Selection

The following features where used in the original dataset. Read about them in "features_info.txt" provided with the original dataset.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The original dataset used these features to estimate several variables such as:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* ... and more

In this assignment we are only interested in the mean() and std() variables.

## Processing

I did the following processing of the original dataset. See "run_analysis.R" for the complete analysis code.

* The subjects and activities were added as columns to the training and test sets
* The training and test sets were merged
* The columns containing mean() and std() variables were extracted
* The activity numbers were echanged with descriptive names
* The columns where labeled using the original names from "features.txt" and then cleaned up a bit
* A new tidy dataset where created by grouping by subject and activity, and computing the mean for each other column. The dataset was saved as "tidy.csv".
