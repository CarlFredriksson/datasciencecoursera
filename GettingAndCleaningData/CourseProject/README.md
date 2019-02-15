This is a repository containing the required files for the "Getting and Cleaning Data Course Project".

## Files

* run_analysis.R contains the R code for the analysis performed
* tidy.txt contains the final tidy data set created by run_analysis.R
* CodeBook.R contains an explanation of what variables where used and what analysis was done

## Directions

To be able to run run_analysis.R you need to download and copy the "UCI HAR Dataset" and put in the same directory as run_analysis.R. To read the tidy.txt file in R you can use the following code:

```
tidy <- read.table("tidy.txt", header = TRUE)
```

## Tidy-ness

The dataset in tidy.txt is tidy. The following criteria from Hadley's paper are followed:

* Each variable forms a column.
* Each observation forms a row.
* Each type of observational unit forms a table.
