GACD-Course-Project
===================

Course Project for Coursera JHU Course "Getting and Cleaning Data"

This README describes how to set up and run the scripted contained in this repo.  These instructions have been tested on MacOS.  

1. download the [UCI Human Activity Recognition data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2. Unzip this file and cd into the directory created "UCI HAR Datasets".  Display the full path of the "UCI HAR Datasets" ("pwd" command).  You will need this in step 4.

3. Download the [run_analysis.R](https://github.com/jrosenbl/GACD-Course-Project/archive/master.zip).  It doesn't matter where you put it (as long as it's on the same computer as the data).  Unzip this file and cd into the directory created "GACD-Course-Project".  

4. Open run_analysis.R in your favorite text editor and at the top of the file change the quoted string following PROJECT_DIR to the quoted full path ending in 'UCI HAR Datasets'.  Save your change and exit the text editor.

5. Start R in a terminal window or start up Rstudio and source the script: "source('run_analysis.R')".
 
The script implements the instructions for the course project and ultimately generates a "tidy data set" comprised of the averages of 66 mean and standard deviation variables grouped by subject number and activity. The script writes this data set to the file identifed at the top of the scipt by the constant "TIDY_DATA_FILE" in the directory identified by "PROJECT_DIR" (which you edited in step 4 above). The default file name is "avgs-by-subject-activity.txt"

See CodeBook.md in this repository for more  information about the data.
5. start R in a terminal window or Rstudio and source the script: source('run_analyis.R')


