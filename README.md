GACD-Course-Project
===================

Course Project for Coursera JHU Course "Getting and Cleaning Data"

This README describes how to set up and run the scripted contained in this
repo.  These instructions have been tested on MacOS.  

1. download the [UCI Human Activity Recognition data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2. Unzip this file and cd into the directory created "UCI HAR Datasets".
   Display the full path of the "UCI HAR Datasets" ("pwd" command).  You will
   need this in step 4.

3. Download the
   [run_analysis.R](https://github.com/jrosenbl/GACD-Course-Project/archive/master.zip).
   It doesn't matter where you put it (as long as it's on the same computer as
   the data).  Unzip this file and cd into the directory created
   "GACD-Course-Project".  

4. Open run_analysis.R in your favorite text editor and at the top of the file
   change the quoted string following PROJECT_DIR to the quoted full path
   ending in 'UCI HAR Datasets'.  Save your change and exit the text editor.

5. Start R in a terminal window or start up Rstudio and source the script:
   "source('run_analysis.R')".
 
The original source data processed by this script is described in the
README.txt file that accompanies the data set. As described in this README.txt
file, the data is partitioned into test and training sets. Each of these
comprises multiple files that can be merged column-wise so that each row
represents a subset of the measured and computed values for one experiment
subject and one activity. The complete set of values for one subject and
activity spans multiple rows.

The run_analysis.R script first performs the column-wise merging for each of
the 2 data sets test and train and then combines them row-wise into one long
and wide data set. The script then groups the observations by subject and
activity and summarizes the group by calculating averages for only the mean and
standard deviation variables. This produces a tidy data set with a complete set
of values (66 feature variables) for each subject and activity combination. 30
subjects x 6 activities yields 180 combinations. Thus the tidy data set has 180
rows. The script writes the tidy data set (along with column headers in line 1)
to a text file "avgs-by-subject-activity.txt".

See CodeBook.md in this repository for more  information about the data.


