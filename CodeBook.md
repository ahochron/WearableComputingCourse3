DATA DESCRIPTION

Alex N Hochron
     Human Activity Recognition Using Smartphones Dataset
     
Original Dataset from
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

EXTENT OF PROCESSING:  Dataset provided by Smartlab was modified to create tidier
datasets focused solely on Mean and Standard Deviation values.

DATA FORMAT:  Data Frames in R
                                                                                
     Part 1: Means and Standard Deviations of All Measured Subjects                  
     File Structure: rectangular                     
     Cases: 10,299
     Variables: 20
     Record Length: 20
     Records Per Case: 1
     
     Part 2: Average of Means and Standard Deviations of All Subjects and Activities 
     File Structure: rectangular                     
     Cases: 36
     Variables: 19
     Record Length: 19
     Records Per Case: 1
     
CODEBOOK FOR MEANS AND STANDARD DEVIATIONS OF ALL MEASURED SUBJECTS
 "Allset"
 
 VARIABLE NAME                                    TYPE      RANGE     EXPLANATION
Time-Body-Acceleration-Magnitude-Mean           NUMERIC     -1 to 1   Mean of           subject's Time-domain signal for magnitude from body accelerometer 
Time-Body-Acceleration-Magnitude-Stdv           NUMERIC     -1 to 1   Standard          deviation  of subject's time-domain signal for magnitude of body acceleration
Time-Gravity-Acceleration-Magnitude-Mean        NUMERIC     -1 to 1   Mean of           subject's time-domain signal for magnitude from gravity accelerometer
Time-Gravity-Acceleration-Magnitude-Stdv        NUMERIC     -1 to 1   Standard          deviation of subject's time-domain signal for magnitude of gravity acceleration
Time-Body-Acceleration-JerkSignal-Mean          NUMERIC     -1 to 1   Mean of
   subject's time-domain signal for jerk accelerometer
Time-Body-Acceleration-JerkSignal-Stdv          NUMERIC     -1 to 1   Standard deviation of subject's time-domain signal for jerk accelerometer
Time-Body-Gyroscope-Magnitude-Mean              NUMERIC     -1 to 1   Mean of
   subject's time-domain signal for magnitude of gyroscope
Time-Body-Gyroscope-Magnitude-Stdv              NUMERIC     -1 to 1   Standard          deviation of subject's time-domain signal for magnitude of gyroscope
Time-Body-Gyroscope-Jerk-Magnitude-Mean         NUMERIC     -1 to 1   Mean of
   subject's time-domain signal for magnitude of jerk gyroscope
Time-Body-Gyroscope-Jerk-Magnitude-Stdv         NUMERIC     -1 to 1   Standard          deviation of subject's time-domain signal for magnitude of jerk gyroscope
Frequency-Body-Acceleration-Magnitude-Mean      NUMERIC     -1 to 1   Mean of
   subject's frequency domain signal for magnitude of body acceleration 
Frequency-Body-Acceleration-Magnitude-Stdv      NUMERIC     -1 to 1   Standard          deviation  of subject's frequency domain signal for magnitude of body acceleration
Frequency-Body-Acceleration-Jerk-Magnitude-Mean NUMERIC     -1 to 1   Mean of
   subject's frequency domain signal for magnitude of body jerk acceleration
Frequency-Body-Acceleration-Jerk-Magnitude-Stdv NUMERIC     -1 to 1   Std. dev. of
   subject's frequency domain signal for magnitude of body jerk acceleration
Frequency-Gyroscope-Jerk-Magnitude-Mean         NUMERIC     -1 to 1   Mean of
   subject's frequency domain signal for magnitude of jerk gyroscope
Frequency-Gyroscope-Jerk-Magnitude-Stdv         NUMERIC     -1 to 1   Std. dev. of
   subject's frequency domain signal for magnitude of jerk gyroscope
Activity                                        String                Activity logged    by subject ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING") 
SubjectNum                                      NUMERIC     1 to 30   Subject number

CODEBOOK FOR MEANS AND STANDARD DEVIATIONS OF ALL MEASURED SUBJECTS
 "Tidyset"
 
 VARIABLE NAME                                    TYPE      RANGE     EXPLANATION
Time-Body-Acceleration-Magnitude-Mean           NUMERIC     -1 to 1   Mean of             all mean time-domain signals for magnitude from body accelerometer for subject       or activity 
Time-Body-Acceleration-Magnitude-Stdv           NUMERIC     -1 to 1   Mean of             Standard deviations of all time-domain signals for magnitude of body
     acceleration for subject or activity
Time-Gravity-Acceleration-Magnitude-Mean        NUMERIC     -1 to 1   Mean of             all mean time-domain signals for magnitude from gravity accelerometer for            subject or activity
Time-Gravity-Acceleration-Magnitude-Stdv        NUMERIC     -1 to 1   Mean of 
     Standard deviations of all time-domain signals for magnitude of gravity              acceleration for subject or activity
Time-Body-Acceleration-JerkSignal-Mean          NUMERIC     -1 to 1   Mean of
     all mean time-domain signal for jerk accelerometer for subject or activity
Time-Body-Acceleration-JerkSignal-Stdv          NUMERIC     -1 to 1   Mean of             standard deviations of all time-domain signal for jerk accelerometer for subject      or activity
Time-Body-Gyroscope-Magnitude-Mean              NUMERIC     -1 to 1   Mean of all         mean time-domain signals for magnitude of gyroscope for subject or activity
Time-Body-Gyroscope-Magnitude-Stdv              NUMERIC     -1 to 1   Mean of             standard deviations of all time-domain signal for magnitude of gyroscope for         subject or activity
Time-Body-Gyroscope-Jerk-Magnitude-Mean         NUMERIC     -1 to 1   Mean of all         mean time-domain signals for magnitude of jerk gyroscope for subject or activity
Time-Body-Gyroscope-Jerk-Magnitude-Stdv         NUMERIC     -1 to 1   Mean of             standard deviations of all time-domain signal for magnitude of jerk gyroscope        for subject or activity.
Frequency-Body-Acceleration-Magnitude-Mean      NUMERIC     -1 to 1   Mean of
     all mean frequency domain signals for magnitude of body acceleration for subject      or activity 
Frequency-Body-Acceleration-Magnitude-Stdv      NUMERIC     -1 to 1   Mean of             standard deviations of all frequency domain signal for magnitude of body             acceleration for subject or activity
Frequency-Body-Acceleration-Jerk-Magnitude-Mean NUMERIC     -1 to 1   Mean of
     all mean frequency domain signal for magnitude of body jerk acceleration for         subject or activity
Frequency-Body-Acceleration-Jerk-Magnitude-Stdv NUMERIC     -1 to 1   Mean of 
     standard deviations of all frequency domain signal for magnitude of body jerk        acceleration for subject or activity
Frequency-Gyroscope-Jerk-Magnitude-Mean         NUMERIC     -1 to 1   Mean of
     all mean frequency domain signals for magnitude of jerk gyroscope for subject or      activity
Frequency-Gyroscope-Jerk-Magnitude-Stdv         NUMERIC     -1 to 1   Mean of             standard deviations of all frequency domain signal for magnitude of jerk             gyroscope for subject or activity
Identifier                                      STRING                Identifies          whether mean refers to a particular subject (referenced as "Subject Number") or      activity (referenced as Activity type)