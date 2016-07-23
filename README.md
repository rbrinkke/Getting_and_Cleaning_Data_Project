# Getting_and_Cleaning_Data_Project
Peer Graded Assignment: Getting and Cleaning Data Course Project

-- For running the R script you need to install the package dplyr

-- In the script run_analysis.R set the prj_home_dir to the root of the project

-- UCI HAR Dataset folder is created in de root from the unzipped data.



Steps in R script

1 Download and unzip the data if not exists.

2 Load the activity labels 

3 Load the features
  The features whe use for subsetting the waned columns and format the rows for more readable format.
  
4 Loading the train data and combine it to one dataset
  The three files are load into R for the train_x we create a subset and modify the colnames with the values of step 3
  
5 Loading the test data ( same as the train data )

6 Combine test and train dataset and make a factor of the activity column, input from step 2

7 Create a Tidy dataset and write it to the file tidy.txt in the prj_home_dir

