CourseProject_TidyData
======================

Repository for the Course Project for Getting and Cleaning Data on Coursera


## AUTHOR

Nikos Alexandris


## DESCRIPTION

This repository, titled "CourseProject_TidyData", contains information, data and
code for a project related to the R [0] related course "Getting and Cleaning 
Data" on Coursera [1][2].
The purpose of this project is to demonstrate the ability to collect, work 
with, and clean a data set using R.

The code contained in the script named "run_analysis.R", can be sourced from 
inside an R session. For example, launching a new R session
(best from inside the directory where the data and 
script are stored -- if not, set the working directory to point to it by using 
the function "setwd()") and instructing

`source("run_analysis.R")`

will read and execute the script that performs certain operations on a data set
in order to prepare tidy data that can be used for later analysis.


## DATA SOURCES

The original data set to be processed for the course project is available as a 
"zip" file at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

It is a multidimensional time-series, composed by

1) 30 subjects (experiment volunteers),
2) various activities (for each subject) and
3) various measured variables (for each activity).

After downloading, it should be "unzipped". Details for the data set are 
provided in its README.md file.

A full description of the data is available at:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

  
## TASKS

| Overview

The R script called "run_analysis.R", merges the original "training" and "test" 
data sets,  extracts measurements on the mean and standard deviation for each
measurement, uses descriptive activity names and labels the variables, 
generates a tidy data set with the average of each variable for each activity 
and each subject.

| Details 

1. imports the train and the test data sets (as data.frames)

2. imports the variable names (as a vector) from the original file 
"features.txt" (keeps only the strings)

3. cleans-up the variable names from leftover parenthesis characters and
expands them so as to make it easier to read and understand them

3. feeds the "clean" variable names to the train and the test data sets

4. attaches the activity class numbers and labels to the train and the test 
data sets 

5. binds (=merges) the train and the test data in one data.frame

6. attaches class numbers and descriptive labels for the activities

7. reorders the columns of the merged data.frame so as to place the Activity 
labels in the 3rd column

8. extracts all columns which contain the strings "mean" and "std" in their 
variable names, ignoring the letter case,

9. utilises the "reshape2" library to "melt" the data set and derive mean 
values for the measured variables groupped by Subject & Activity

10. adjusts the variable names for the tidy data set

Finally, the tidy data set provided in this repository (object named 
"data.sub.tidy", exported as "tidy.RData"), as derived from all of the above manipulations of the 
original data set, has been created by using R's "write.table()" function.

The same function has been used to export the variable names for the tidy data set
("features.tidy", exported as "features.tidy.RData").


## LEGAL NOTICES

For this repository, no LICENSE or COPYRIGHT applies. However, the LICENSE for
the original data set, as retrieved from its source README.md file, is:


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



## CREDITS & ACKNOLEDGEMENTS

- Coursera <http://www.coursera.org/>
- Instructor(s) of the Course <https://class.coursera.org/getdata-004/wiki/About_the_Instructor>
- Participants in the Courser's Discussion Forums <https://class.coursera.org/getdata-004/forum>
- Secial thanks to the "Community TA"s
  -- David Hood <https://class.coursera.org/getdata-004/forum/profile?user_id=134866>
  -- Scott von Kleeck <https://class.coursera.org/getdata-004/forum/profile?user_id=2161770>


## SOURCES & REFERENCES

[0] <http://www.r-project.org/>

[1] <http://www.coursera.org>

[2] 
<https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions>

| Useful References

- Regular Expressions as used in R: <http://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html>
- On "removing a comma from a digits portion string": <http://stackoverflow.com/a/12126997/1172302>

- On "gsub and multiple replacements": <https://stat.ethz.ch/pipermail/r-help/2008-June/163634.html>
- On "Converting data between wide and long format": <http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/>

- "An Introduction to reshape2": <http://seananderson.ca/2013/10/19/reshape.html>
- On "value.name in melt": <https://groups.google.com/forum/#!topic/manipulatr/XP6MOotmY4Q>