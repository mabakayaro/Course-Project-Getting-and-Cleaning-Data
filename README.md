# Course-Project-Getting-and-Cleaning-Data
Course Project Getting and Cleaning Data

Data have been collected from the accelerometers 
from the Samsung Galaxy S smartphones.


Script description :

Before running the analysis, the working directory must be set to this path :

~\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset

First, we construct the test and train set separately, binding it to their respective subject and activitiy set.
Then we bind the two sets to regroup all the datas in the dataset that I named "table1". 
Then we used the features names contained in the feature file to name the different measurements/variable of the obtained
set. We also create the names "Subject_ID" and "Activity_ID " for the first two columns of the dataset.

In step two, we extract only the measurements on the mean thanks to the select function. We repeat the same operation
with the standard deviation measurements. We then cbind the two dataset to obtain the table2

In the third step, I labelled the Activity names with the factor() function.

The 4th  step consist in replacing "-" by "_" and deleting the "()" in variable names (but I don't know why, icouldn't 
get rid of the parenthesis sign).

In the final step, I reshape the table2 to obtain a tidy data set with the average of each variable for each activity 
and each subject using melt() and dcast() function.
  