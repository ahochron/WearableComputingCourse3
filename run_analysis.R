clean <- function () {
     
     ## Load applicable libraries
     library(dplyr)
    
    ## Download and unzip files
     if (!file.exists("./data")) {dir.create("./data")}
     fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileUrl,destfile = "./data/wearable.zip")
     unzip("./data/wearable.zip",exdir="./data")

    ## Read from files into R
     testfile <- file("UCI HAR Dataset/test/x_test.txt")
     testset<-read.table(testfile, header=FALSE)
     
     testlabelfile <- file("UCI HAR Dataset/test/y_test.txt")
     testlabels <- read.table(testlabelfile)
     
     trainfile <- file("UCI HAR Dataset/train/X_train.txt")
     trainset<-read.table(trainfile)

     trainlabelfile <- file("UCI HAR Dataset/train/y_train.txt")
     trainlabels <- read.table(trainlabelfile)

     activlabelfile <- file("UCI HAR Dataset/activity_labels.txt")
     activlabels <- read.table(activlabelfile)

     featurefile <- file("UCI HAR Dataset/features.txt")
     features <- read.table(featurefile)
     
     testsubjectfile <- file("UCI HAR Dataset/test/subject_test.txt")
     testsubjects <- read.table(testsubjectfile)
     
     trainsubjectfile <- file("UCI HAR Dataset/train/subject_train.txt")
     trainsubjects <- read.table(trainsubjectfile)

     ## Rename activity columns
     names(testlabels)[names(testlabels)=="V1"] <- "Activity"
     names(trainlabels)[names(trainlabels)=="V1"] <- "Activity"
     
     ## Rename subject columns
     names(testsubjects)[names(testsubjects)=="V1"] <- "SubjectNum"
     names(trainsubjects)[names(trainsubjects)=="V1"] <- "SubjectNum"
     
     ## Add column with activity labels to test and training sets
     testset2 <- cbind(testset,testlabels) 
     trainset2 <- cbind(trainset,trainlabels)
     
     ## Add column with subject info to test and training sets
     testset3 <- cbind(testset2,testsubjects)
     trainset3 <- cbind(trainset2,trainsubjects)
     
     ## Combine test and train data sets into one
     allset <- rbind(testset3,trainset3)
     
     ## Rename all columns ending with mean and stddev
     names(allset)[names(allset)=="V201"] <- "Time-Body-Acceleration-Magnitude-Mean"
     names(allset)[names(allset)=="V202"] <- "Time-Body-Acceleration-Magnitude-Stdv"
     names(allset)[names(allset)=="V214"] <- "Time-Gravity-Acceleration-Magnitude-Mean"
     names(allset)[names(allset)=="V215"] <- "Time-Gravity-Acceleration-Magnitude-Stdv"
     names(allset)[names(allset)=="V227"] <- "Time-Body-Acceleration-JerkSignal-Mean"
     names(allset)[names(allset)=="V228"] <- "Time-Body-Acceleration-JerkSignal-Stdv"
     names(allset)[names(allset)=="V240"] <- "Time-Body-Gyroscope-Magnitude-Mean"
     names(allset)[names(allset)=="V241"] <- "Time-Body-Gyroscope-Magnitude-Stdv"
     names(allset)[names(allset)=="V253"] <- "Time-Body-Gyroscope-Jerk-Magnitude-Mean"
     names(allset)[names(allset)=="V254"] <- "Time-Body-Gyroscope-Jerk-Magnitude-Stdv"
     names(allset)[names(allset)=="V503"] <- "Frequency-Body-Acceleration-Magnitude-Mean"
     names(allset)[names(allset)=="V504"] <- "Frequency-Body-Acceleration-Magnitude-Stdv"
     names(allset)[names(allset)=="V516"] <- "Frequency-Body-Acceleration-Jerk-Magnitude-Mean"
     names(allset)[names(allset)=="V517"] <- "Frequency-Body-Acceleration-Jerk-Magnitude-Stdv"
     names(allset)[names(allset)=="V529"] <- "Frequency-Gyroscope-Magnitude-Mean"
     names(allset)[names(allset)=="V530"] <- "Frequency-Gyroscope-Magnitude-Stdv"
     names(allset)[names(allset)=="V542"] <- "Frequency-Gyroscope-Jerk-Magnitude-Mean"
     names(allset)[names(allset)=="V543"] <- "Frequency-Gyroscope-Jerk-Magnitude-Stdv"
     
     ## Remove all columns that do not end with mean or std
     allset <- select(allset,-starts_with("V"))
    
     subset <- allset       #creates copy without name descriptors for tidyset step
     
     ## Change activities from numeric codes to name descriptors
     allset$Activity[allset$Activity == "1"] <- "WALKING"
     allset$Activity[allset$Activity == "2"] <- "WALKING_UPSTAIRS"
     allset$Activity[allset$Activity == "3"] <- "WALKING_DOWNSTAIRS"
     allset$Activity[allset$Activity == "4"] <- "SITTING"
     allset$Activity[allset$Activity == "5"] <- "STANDING"
     allset$Activity[allset$Activity == "6"] <- "LAYING"
     
     ## Export allset as a tab-delimited text file
     write.table(allset, "tidydata1.txt", sep="\t")
     
     ## Create a second, independent tidy data set w/ avg of each subject & activity 
     tidyset <- subset[1:36,]    #create data frame to store subject data
     tidyset <- select(tidyset,-starts_with("Activ")) #remove Activity column
     names(tidyset)[names(tidyset)=="SubjectNum"] <- "Identifier"
     
     ## Zero out subject data frame (all rows, columns 1-18)
     row <- 1
     col <- 1
     while (col<19)
     {while (row<37) {
         tidyset[row,col] <- 0
         row <- row + 1
     }
         col <- col + 1
         row <- 1}
     
     ## Calculate means of each subject and store in tidyset
     subject <- 1
     while (subject < 31)
         {subjmean <- colMeans(subset(subset, SubjectNum==subject))
          tidyset[subject,1:18] <- subjmean
          tidyset[subject,19] <- paste("Subject", subject)
          subject <- subject + 1
         }
     
     ## Calculate means of each activity and store in tidyset
     Activ <- 1
     while (Activ < 7)
        {activmean <- colMeans(subset(subset, Activity==Activ))
         tidyset[(Activ+30),1:18] <- activmean
         tidyset[(Activ+30),19] <- paste(Activ)
         Activ <- Activ + 1
     }
     
     ## Change activity from numbers to names
     tidyset$Identifier[tidyset$Identifier == "1"] <- "WALKING"
     tidyset$Identifier[tidyset$Identifier == "2"] <- "WALKING_UPSTAIRS"
     tidyset$Identifier[tidyset$Identifier == "3"] <- "WALKING_DOWNSTAIRS"
     tidyset$Identifier[tidyset$Identifier == "4"] <- "SITTING"
     tidyset$Identifier[tidyset$Identifier == "5"] <- "STANDING"
     tidyset$Identifier[tidyset$Identifier == "6"] <- "LAYING"
     
     ## Export tidyset as a tab-delimited text file
     write.table(tidyset, "tidydata2.txt", sep="\t")
}