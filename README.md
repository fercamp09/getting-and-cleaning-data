# getting-and-cleaning-data
Course project for getting and cleaning data, course on the data science John Hopkins specialization

How to run the analysis
======================================
The data should be in the same folder as the run_analysis.R

Replace PATH_TO_FILE with your actual path
In R: source('/PATH TO FILE/run_analysis.R')

The output file is called tidy_dataset.txt, found in the same folder after running the code.

Codebook
======================================

Each row contains the average of each variable for each activity and each subject.
======================================

For each record it is provided a column variable:

- "subject": Is a number representing a test subject who performed the activity. Its range is from 1 to 30. 
- "activity": Is the name of the activity performed by the subject. Character values.
- "activity_code": Codef of the activity performed by the subject. Its range is from 1 to 6.                 

Column variables contains '-XYZ' to denote 3-axial signals in the X, Y and Z directions of the following measurements:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

For each measurement, the mean and standard deviation is named with:
- mean()
- std()

Units:
- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
- The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
- The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

Notes: 
======
- Features are normalized and bounded within [-1,1].