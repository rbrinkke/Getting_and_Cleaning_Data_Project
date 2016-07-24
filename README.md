# Getting_and_Cleaning_Data_Project
Peer Graded Assignment: Getting and Cleaning Data Course Project

Data is from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

For more information; https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Setup eviroment
1. For running the R script you need to install the package dplyr
2. In the script run_analysis.R set the prj_home_dir to the root of the project
3. UCI HAR Dataset folder is created in de root from the unzipped data.



#### Steps in R script

1. Download and unzip the data if not exists.
2. Load the activity labels
3. Load the features
  The features whe use for subsetting the waned columns and format the rows for more readable format.
4. Loading the train data and combine it to one dataset
  The three files are load into R for the train_x we create a subset and modify the colnames with the values of step 3
5. Loading the test data ( same as the train data )
6. Combine test and train dataset and make a factor of the activity column, input from step 2
7. Create a Tidy dataset and write it to the file tidy.txt in the prj_home_dir


####  The input dataset/zip from UCI includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
