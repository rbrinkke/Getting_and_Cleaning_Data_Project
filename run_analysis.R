# load de packages needed
library(dplyr)
library(data.table)

prj_home_dir <- "Z:/Rob/coursera-getting-and-cleaning-data-project/"
setwd(prj_home_dir)

# Downlowd the projectfile and unzip
filename_zip <- "getdata_dataset.zip"
if (!file.exists(filename_zip)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename_zip, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename_zip) 
}
setwd("./UCI HAR Dataset/")

# Load the features 
activity_labels <- read.table("activity_labels.txt" ,col.names = c("ActivityID","Activity") , stringsAsFactors = FALSE , colClasses=c(ActivityID="numeric",Activity="character"))

# Load the activity labels and subset the requested features
features <- read.table("features.txt", col.names = c("FeatureId","Feature"))

# Get the rows with std and mean
features <- filter(features,grepl('Mean|std',features$Feature))

# Make the colnames more readable, rows are input for colnames dataset
features  %>% mutate(Feature = gsub('-mean', 'Mean',Feature)) %>% 
  mutate(Feature = gsub('-std', 'Std',Feature))  %>% mutate(Feature = gsub('[-()/,]', '',Feature)) -> features

# Load the train data
train_x <- read.table("./train/X_train.txt",header = FALSE)
# Only the columns whe want
train_x <- train_x[,features$FeatureId]
# Give the columns a better name
colnames(train_x) <- features$Feature
train_Activities <- read.table("./train/y_train.txt", header = FALSE , col.names = c("Activity"))
train_Subjects <- read.table("./train/subject_train.txt" , header = FALSE , col.names = c("Subject") )
train <- cbind(train_Subjects, train_Activities, train_x)

# Load the test data
test_x <- read.table("./test/X_test.txt",header = FALSE)
# Only the columns whe want
test_x <- test_x[,features$FeatureId]
# Give the columns a better name
colnames(test_x) <- features$Feature
test_Activities <- read.table("./test/y_test.txt", header = FALSE , col.names = c("Activity"))
test_Subjects <- read.table("./test/subject_test.txt" , header = FALSE , col.names = c("Subject") )
test <- cbind(test_Subjects, test_Activities, test_x)

# Combine test and train dataset 
total_data_set <- rbind(train, test)
# Make af factor of the activity
total_data_set$Activity   <- factor(total_data_set$Activity ,levels=activity_labels$ActivityID,labels=activity_labels$Activity)

# Create the tiny data set
# total_data_set %>%  group_by(Activity,Subject) %>%   summarise_each(funs(mean=mean(.)))  %>%
#   arrange(Activity,Subject) -> tidy_data_set
total_data_set %>%  group_by(Subject,Activity) %>%   summarise_each(funs(mean=mean(.)))  %>%
  arrange(Subject,Activity) -> tidy_data_set
# Write the tidy data 
write.table(tidy_data_set, "tidy.txt", row.names = FALSE, quote = FALSE)
