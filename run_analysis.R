run_analysis <- function(){
  library(dplyr)
  library(tidyr)
  library(reshape2)
  
  #This function is designed to:
  #1)import the data sets from:
  #https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  #2) Merges the training and the test sets to create one data set.
  #3)Extracts only the measurements on the mean and standard deviation for each measurement.
  #4)Uses descriptive activity names to name the activities in the data set
  #Appropriately labels the data set with descriptive variable names.
  #5)From the data set in step 4, creates a second, independent tidy data set with the
  # average of each variable for each activity and each subject.
  
  #This section checks to see if a file called "getdata-projectfiles-UCI HAR Dataset.zip"
  #exist in the workspace. If the file is not there it will be downloaded.
  
  if (file.exists("getdata-projectfiles-UCI HAR Dataset.zip") == TRUE){
    rawdata <- unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  }else{
    print("Project Data Not Found, Downloading Data Now")
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    file <- "getdata-projectfiles-UCI HAR Dataset.zip"
    download.file(url,file, method = "curl", quiet = FALSE)
    rawdata <- unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  }
  
#this section extracts the data of interest
  
  #subject data
  test.subj <- read.table(rawdata[14])
  train.subj <- read.table(rawdata[26])
   
  #X data
  test.x <- read.table(rawdata[15])
  train.x <- read.table(rawdata[27])
    
  #Y data
  test.y <- read.table(rawdata[16])
  train.y <- read.table(rawdata[28])
    
#this section merges train and test data
  
  #subject
  subj <- rbind(test.subj,train.subj)
  
  #X
  x <- rbind(test.x,train.x)
  
  #Y
  y <- rbind(test.y,train.y)
  
#this section renames the columns with the descriptive names found in the features file
  v <- read.table(rawdata[2])
  v <- v[,2]
  names(x) <- v
  
  #rename subject data and Y data
  names(subj) <-"Subject"
  names(y) <- "Activity"
  Activity <- y
#this section uses the activity name data to modify the values of Y to the more descriptive activity
#names found in activitylabels.txt file. 
  
  act <- read.table(rawdata[1])
  act[,2] <- as.character(act[,2])
  
  #converts the Activity variable to a factor
  
  Activity <- unlist(Activity)
  Activity <- factor(Activity, levels= act[,1], labels=act[,2])
  

#this section subsets the data to extract the std dev and mean columns
  
  x<-x[,grep(".*mean.*|.*std.*", v)]
  
#this section makes the column names more readable by replacing 
#abreviations with words and removing extra characters
  
  names(x) <- gsub("-mean", " Mean ", names(x))
  names(x) <- gsub("-std", " StanDev ", names(x))
  names(x) <- gsub("()-", " ", names(x))
  names(x) <- gsub("()", "", names(x), fixed=TRUE)
 
    
 
#this section merges Subject, Activity, and X data in that order
 dat <- cbind(subj,Activity,x)

#this section condenses data to averages
 
 tiny<-aggregate(. ~Subject + Activity, dat, mean)
tiny<-tiny[order(tiny$Subject,tiny$Activity),]
 write.table(tiny, file = "tidydata.txt",row.name=FALSE)

}