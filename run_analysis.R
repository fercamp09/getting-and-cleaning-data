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

train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
train <- train_subjects 
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("Y"))
train <- bind_cols(train, Y_train)

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_train_filtered <- X_train %>% select(-(303:344), -(382:423))
features <- read.table("UCI HAR Dataset/features.txt")
features_V2 <- as.character(features$V2)
features_filtered <- c(features_V2[1:302], features_V2[345:381],  features_V2[424:561])

names(X_train_filtered) <- features_filtered
X_train_filtered_mean <- X_train %>% select(contains("mean"))


train <- getSdAndMean(X_train, train, "X")
body_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
train <- getSdAndMean(body_acc_x_train, train, "body_acc_x")
body_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
train <- getSdAndMean(body_acc_y_train, train, "body_acc_y")
body_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
train <- getSdAndMean(body_acc_z_train, train, "body_acc_z")
body_gyro_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
train <- getSdAndMean(body_gyro_x_train, train, "body_gyro_x")
body_gyro_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
train <- getSdAndMean(body_gyro_y_train, train, "body_gyro_y")
body_gyro_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
train <- getSdAndMean(body_gyro_z_train, train, "body_gyro_z")
total_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
train <- getSdAndMean(total_acc_x_train, train, "total_acc_x")
total_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
train <- getSdAndMean(total_acc_y_train, train, "total_acc_y")
total_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
train <- getSdAndMean(total_acc_z_train, train, "total_acc_z")

test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
test <- test_subjects
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt",  col.names = c("Y"))
test <- bind_cols(test, Y_test)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- getSdAndMean(X_test, test, "X")
body_acc_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
test <- getSdAndMean(body_acc_x_test, test, "body_acc_x")
body_acc_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
test <- getSdAndMean(body_acc_y_test, test, "body_acc_y")
body_acc_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
test <- getSdAndMean(body_acc_z_test, test, "body_acc_z")
body_gyro_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
test <- getSdAndMean(body_gyro_x_test, test, "body_gyro_x")
body_gyro_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
test <- getSdAndMean(body_gyro_y_test, test, "body_gyro_y")
body_gyro_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
test <- getSdAndMean(body_gyro_z_test, test, "body_gyro_z")
total_acc_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
test <- getSdAndMean(total_acc_x_test, test, "total_acc_x")
total_acc_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
test <- getSdAndMean(total_acc_y_test, test, "total_acc_y")
total_acc_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
test <- getSdAndMean(total_acc_z_test, test, "total_acc_z")

complete <- bind_rows(train, test)

grouped <- complete %>% group_by(subject, Y) %>% summarise_all(mean)
write.table(grouped, "tidy_dataset.txt", row.names=FALSE)