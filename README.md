# getting-and-cleaning-data
Course project for getting and cleaning data, course on the data science John Hopkins specialization


For each record it is provided a column variable:
======================================

"subject": Is a number representing a test subject who performed the activity. Its range is from 1 to 30. 

"Y": Label of the activity performed by the subject. Its range is from 1 to 6.                 
"sd_X": Standard deviation of the X variable ( A 561-feature vector with time and frequency domain variables )             
"mean_X": Mean of the X variable ( A 561-feature vector with time and frequency domain variables )           

The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
"sd_body_acc_x": Standard deviation of the body acceleration in X    
"mean_body_acc_x": Mean of the body acceleration in X  
"sd_body_acc_y": Standard deviation of the body acceleration in Y    
"mean_body_acc_y": Mean of the body acceleration in Y  
"sd_body_acc_z": Standard deviation of the body acceleration in Z    
"mean_body_acc_z": Mean of the body acceleration in Z 
"sd_body_gyro_x": Standard deviation of the body gyroscope in X

The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
"mean_body_gyro_x": Mean of the body gyroscope in X   
"sd_body_gyro_y": Standard deviation of the body gyroscope in Y   
"mean_body_gyro_y": Mean of the body gyroscope in Y
"sd_body_gyro_z": Standard deviation of the body gyroscope in Z   
"mean_body_gyro_z": Mean of the body gyroscope in Z 

The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axi
"sd_total_acc_x": Standard deviation of the total acceleration in X   
"mean_total_acc_x": Mean of the total acceleration in X 
"sd_total_acc_y": Standard deviation of the total acceleration in Y   
"mean_total_acc_y": Mean of the total acceleration in Y
"sd_total_acc_z": Standard deviation of the total acceleration in Z   
"mean_total_acc_z": Mean of the total acceleration in Z

Notes: 
======
- Features are normalized and bounded within [-1,1].