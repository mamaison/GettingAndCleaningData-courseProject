library(dplyr)
library(plyr)
library(reshape2)

x_train <- read.table('UCI HAR Dataset/train/x_train.txt', header=F)
features <- read.table('UCI HAR Dataset/features.txt', header=F)
feature_names <- features[,2]
colnames(x_train)<- feature_names
y_train <- read.table('UCI HAR Dataset/train/y_train.txt', header=F) 
colnames(y_train) <- c('Activity')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt', header=F) 
colnames(subject_train) <- c('Subject')
x_train <- cbind(y_train, x_train)
x_train <- cbind(subject_train, x_train)

x_test <- read.table('UCI HAR Dataset/test/x_test.txt', header=F)
colnames(x_test) <- features[,2]
y_test <- read.table('UCI HAR Dataset/test/y_test.txt', header=F) 
colnames(y_test) <- c('Activity')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt', header=F) 
colnames(subject_test) <- c('Subject')
x_test <- cbind(y_test, x_test)
x_test <- cbind(subject_test, x_test)

all_measures <- rbind(x_train, x_test)

mean_and_std <- select(all_measures,Subject, Activity, contains('mean', 'std'))

mean_and_std[,2] <-mapvalues(mean_and_std[,2], c(1,2,3,4,5,6), c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

measure_names <-names(mean_and_std[3:48])
tidy_data <- melt(mean_and_std, id.vars=c('Subject','Activity'), measure.vars=measure_names,variable.name='Measure',value.name='Value') 
arrange(tidy_data, Subject, Activity)
write.table(tidy_data, file='tidy_data.txt', row.name=F)

