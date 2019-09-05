library("dplyr")
library("purrrlyr")
library("purrr")

getSdAndMean <- function(dataframe, df, name){
  sd_column <- paste("sd", name, sep="_")
  mean_column <- paste("mean", name, sep="_")
  std <- dataframe %>% by_row(purrr::lift_vl(sd), .collate = "rows", .to = sd_column)
  newdf <- std %>% by_row(purrr::lift_vl(mean), .collate = "rows", .to =  mean_column)
  df <- bind_cols(df, select(newdf, sd_column), select(newdf, mean_column))
  df
}

# Read dataset
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) = c("activity_code", "activity")

Y_activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activity_code"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
train <- bind_cols(train_subjects, Y_activity_train)

Y_activity_test <- read.table("UCI HAR Dataset/test/y_test.txt",  col.names = c("activity_code"))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
test <- bind_cols(test_subjects, Y_activity_test)

# Filter dataset repeated columns names
features_V2 <- as.character(features$V2)
features_filtered <- c(features_V2[1:302], features_V2[345:381],  features_V2[424:460],  features_V2[503:561])

X_train_filtered <- X_train %>% select(-(303:344), -(382:423),  -(461:502))
X_test_filtered <- X_test %>% select(-(303:344), -(382:423),  -(461:502))
names(X_train_filtered) <- features_filtered
names(X_test_filtered) <- features_filtered

# Merge test and training dataset
merged <- bind_rows(X_train_filtered, X_test_filtered)
merged_add_info <- bind_rows(train, test)
complete_mean <- merged %>% select(contains("mean"))
complete_std <- merged %>% select(contains("std"))
complete <- bind_cols(merged_add_info, complete_mean, complete_std)
step4 <- left_join(activities, complete, by = NULL, copy=FALSE)

# Group by subject and activity and compute the mean for each 
grouped <- complete %>% group_by(subject, activity_code) %>% summarise_all(mean)
tidy_dataset <- left_join(activities, grouped, by = NULL, copy=FALSE)

# Write tidy dataset to a file
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)
head(tidy_dataset)
# body_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
# train <- getSdAndMean(body_acc_x_train, train, "body_acc_x")
