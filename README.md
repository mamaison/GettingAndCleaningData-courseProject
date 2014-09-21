This script takes data collected from users wearing Galaxy S smartphones while doing activities.
The data is in the UCI HAR Dataset folder. It is separeted in two groups: train and test. The run_analysis script takes the
data from the two groups and produce a tidy data set. It does this in the following order:

- First, it takes the measurements found in th x_train.txt file and changes the names of the columns for the corresponding
names found in the features.txt file.

- The script then load the activity dataset found in the y_train.txt file and changes the name of the column to 'Activity'

- The script then load the subject dataset found in the subject_train.txt file and changes the name of the column to 'Subject'

- The script then merges the two dataset(Activity, Subject) with the measurements dataset.

-The steps above are repeated for the datasets(measurments, activity, subject) corresponding to the test groups.

-The script then merge the two datasets(train, test) together.

-The script selects only the mean and standard deviation measurements

-The script rename the activities. The activiies where first load as id numbers.

-Finally, the script produces a tidy dataset and save it to a file named 'tidy_data.txt'