This ReadMe explains how the "clean" function in the run_analysis.R script 
works and is connected

1)   Load applicable libraries
     The "dplyr" library is loaded to use 'select' functions

2)   Download and unzip files
     First, a 'data' directory is created (if it doesn't already exist)
     Next, the zipped data file is downloaded and stored
     The data is then unzipped, and extracted files stored in the data directory
     
3)   Read from files into R
     The relevant files are downloaded and stored as follows:
          UCI HAR Dataset/test/x_test.txt -- stored as 'testset'
          UCI HAR Dataset/test/y_test.txt -- stored as 'testlabels'
          UCI HAR Dataset/train/X_train.txt -- stored as 'trainset'
          UCI HAR Dataset/train/y_train.txt -- stored as 'trainlabels'
          UCI HAR Dataset/activity_labels.txt -- stored as 'activlabels'  
          UCI HAR Dataset/features.txt -- stored as 'features'
          UCI HAR Dataset/test/subject_test.txt -- stored as 'features'testsubjects'
          UCI HAR Dataset/train/subject_train.txt -- stored as trainsubjects

4)   Column renames and additions
     To make the data tidy, the following identifier variables (previously named         as V1) are renamed to be clearer
     
          In testlabels: "V1" changed to "Activity"
          In trainlabels: "V1" changed to "Activity"
     
          In testsubjects: "V1" changed to "SubjectNum"
          In trainsubjects: "V1" changed to "Activity"
     
     A column is added to include activity labels in test and training sets
          The new data frame with test data and labels is stored in 'testset2'
          The new data frame with train data and labels is stored in 'trainset2'
     
     A column is added to include subject labels in test and training sets
          The new data frame with test data and subjects is stored in 'testset3'
          The new data frame with train data and subjects is stored in 'trainset3'
     
5)   The test and train data sets are next combined into one
          'allset' is the new data frame with both 'testset3' and 'trainset3' data

6)   All columns which measure mean and standard deviations are renamed, as follows
     (see Codebook for exact description of each column name)
       
          "V201" is renamed "Time-Body-Acceleration-Magnitude-Mean"
          "V202" is renamed "Time-Body-Acceleration-Magnitude-Stdv"
          "V214" is renamed "Time-Gravity-Acceleration-Magnitude-Mean"
          "V215" is renamed "Time-Gravity-Acceleration-Magnitude-Stdv"
          "V227" is renamed "Time-Body-Acceleration-JerkSignal-Mean"
          "V228" is renamed "Time-Body-Acceleration-JerkSignal-Stdv"
          "V240" is renamed "Time-Body-Gyroscope-Magnitude-Mean"
          "V241" is renamed "Time-Body-Gyroscope-Magnitude-Stdv"
          "V253" is renamed "Time-Body-Gyroscope-Jerk-Magnitude-Mean"
          "V254" is renamed "Time-Body-Gyroscope-Jerk-Magnitude-Stdv"
          "V503" is renamed "Frequency-Body-Acceleration-Magnitude-Mean"
          "V504" is renamed "Frequency-Body-Acceleration-Magnitude-Stdv"
          "V516" is renamed "Frequency-Body-Acceleration-Jerk-Magnitude-Mean"
          "V517" is renamed "Frequency-Body-Acceleration-Jerk-Magnitude-Stdv"
          "V529" is renamed "Frequency-Gyroscope-Magnitude-Mean"
          "V530" is renamed "Frequency-Gyroscope-Magnitude-Stdv"
          "V542" is renamed "Frequency-Gyroscope-Jerk-Magnitude-Mean"
          "V543" is renamed "Frequency-Gyroscope-Jerk-Magnitude-Stdv"
     
7)   All columns that do not measure mean or standard deviation are then removed

8)   A copy of the 'allset' data is made, called 'subset' to use as tidy set #2

9)   Activities in allset are changed from numeric codes to name descriptors
          "1" is renamed "WALKING"
          "2" is renamed "WALKING_UPSTAIRS"
          "3" is renamed "WALKING_DOWNSTAIRS"
          "4" is renamed "SITTING"
          "5" is renamed "STANDING"
          "6" is renamed "LAYING"
     
10)  "Allset" is exported to a tab-delimited text file named "tidyset1.txt"
     
11)  To create a second, independent tidy data set with average of each subject &        activity:
     
     First, tidyset is reshaped to store the proper number of observations (36) 
     Next, the 'Activity' column is removed
     Then the "SubjectNum" column is renamed "Identifier"
     Finally, all observations are set to zero, using a while-loop
     
12)  'Tidyset' rows 1-30 are filled with the mean measurements for each subject
     This is once again done with a while loop and the colMeans function
     
13)  'Tidyset' rows 31-36 are filled with the mean measurements for each activity        This is once again done with a while loop colMeans function
     
14)  Activities in tidyset are changed from numeric codes to name descriptors
          "1" is renamed "WALKING"
          "2" is renamed "WALKING_UPSTAIRS"
          "3" is renamed "WALKING_DOWNSTAIRS"
          "4" is renamed "SITTING"
          "5" is renamed "STANDING"
          "6" is renamed "LAYING"

15)  'Tidyset' is exported to a tab-delimited text file named "tidyset2.txt"