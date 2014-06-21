# start with a clean workspace
rm(list=ls())

PROJECT_DIR = '~/documents/Learning/Coursera/Getting and Cleaning Data/GACD-Course-Project/UCI HAR Dataset'
FEATURES_FILE = 'features.txt'
ACTIVITY_LABELS_FILE = 'activity_labels.txt'
TIDY_DATA_FILE = 'avgs-by-subject-activity-2.txt'

get_set = function(set) {
  #  This function takes advantage of the common naming convention used for both the test and training data
  #  It assumes that the current working directory is the project directory PROJECT_DIR and the function parameter 'set'
  #  will have either the value 'test' or 'train'.  It uses these values to construct 3 file names from which data is
  #  read:
  #    ./test/X_test.txt -- test set data
  #    ./test/y_test.txt -- activity labels file
  #    ./test/subject_test.txt -- subjects file
  #  Subsitute 'train' for 'test' in the above 3 lines to get the corresponding training set file names.
  #
  data_file = paste0(set,'/X_',set,'.txt')
  labels_file = paste0(set,'/y_',set,'.txt')
  subjects_file = paste0(set,'/subject_',set,'.txt')
  
  message('reading data for ',set)
  data_set = read.table(data_file)
  message('reading subjects for ',set)
  subjects = read.table(subjects_file,col.name='subject',colClasses='integer')
  message('reading labels for ',set)
  labels = read.table(labels_file, col.name='label', colClasses='integer')
  
  cbind(subjects, labels, data_set)
}

setwd(PROJECT_DIR)

test_set = get_set('test')
train_set = get_set('train')

message('rbinding the 2 sets')
merged_set = rbind(test_set, train_set)

# read table of 561 features into a data frame named 'features'.  
# will use this to create column names for the result sets
#
features = read.table(FEATURES_FILE, col.names=c('idx','name'), colClasses=c('integer','character'))
# set the column names for the data frame
colnames(merged_set) = c('subject', 'label', features$name)

message('converting labels to descriptive names')
# read activity labels table
activity_labels = read.table(ACTIVITY_LABELS_FILE,col.names = c('idx','label'))
merged_set$label = factor(merged_set$label, levels=activity_labels$idx, labels=activity_labels$label)

# select columns giving the mean and std of each measurement
mean_std_cols = grep('[a-zA-Z]+-(mean|std)\\(',value=FALSE,features$name)
mean_std_set = merged_set[,c(1, 2, mean_std_cols+2)]

# cleaning up the column names in the tidy data set
ms_names = colnames(mean_std_set)[-1:-2]
tidy_names = gsub('\\(\\)','',ms_names)
tidy_names = gsub('\\-','.',tidy_names)
tidy_names = sub('^','a',tidy_names)
tidy_names = c('subject', 'activity', tidy_names)
colnames(mean_std_set) = tidy_names

message('generating tidy data set of averages by subject and activity')
# now compute averages for all of the merge set variables by subject and label
sp = split(mean_std_set, list(mean_std_set$subject,mean_std_set$activity))

# for each split compute the result column means and append to tidy_set data frame
#  first initialize tidy_set
tidy_set = data.frame()
for (df in sp) {
  # for each (subject,activity) data frame in the split compute the column means
  cm = colMeans(df[,3:ncol(df)])
  # make a 1 row data frame including the subject, activity and column means
  dfcm = data.frame(df[1,1],df[1,2],matrix(cm,1,length(cm)))
  # append to tidy_set
  tidy_set= rbind(tidy_set,dfcm)
}

# name the columns
colnames(tidy_set) = tidy_names

message('writing tidy data set ',TIDY_DATA_FILE)
write.table(tidy_set,file=TIDY_DATA_FILE,row.names=FALSE)
# read with read.table(TIDY_DATA_FILE,header=TRUE)




