#CODE BOOK
##for the Averages Dataset

###Background

The Averages dataset was calculated from measurements made by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory at DITEN-Università degli Studi di Genova in Genoa, Italy. These measurements were recorded in the Human Activity Recognition Using Smartphones (HARUS) dataset, Version 1.0, provided here: 
[HARUS dataset & documentation](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
The documentation for the HARUS dataset includes a detailed description of the experiment, the nature of the raw measurements and the calculation of the variables in the HARUS dataset. Summarily put, the experiment was conducted with 30 subjects (persons), who engaged in 6 activities (WALKING, WALKING\_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LYING) and a variety of motion measurements were made. Derivative measures were calculated and included in the HARUS dataset.

The Averages dataset was created by 'Zerbera2', a participant in the Getting and Cleaning Data course that is part of the Data Science Specialisation of Coursera. Of the original 561 variables, it selects the 79 that are calculations of means or standard deviations of the raw measuremenets. The HARUS dataset contains multiple observations of each subject engaged in each activity. The Averages dataset aggregates these observations per subject-activity. The method of aggregation is the mean. For each subject, it calculates the average value on each of the 79 variables for each of the 6 activities.

------------

##The Averages Dataset


###Unit of Observation

The unit of observation in the Averages dataset is subject-activity.

###Variables

For the **nominal-level variables**, the following information is given below:

>Short name<br />
>Long name/description
>>Measurement Units
>>>Values

For the **interval-level variables**, the *short name* is given below. Due to their complexity (and Zerbera2's lack of knowledge of the domain of the HARUS project), the *descriptions or long-names* of these variables is to be found only in the HARUS dataset documentation, namely the 'feature-info.txt' file, and is not given below. The *meaurement units* are means of the measures of the derived variables in the HARUS dataset. For explanatory detail of these measures, see the HARUS documentation. The *values* of the interval-level values are normalised within the bounds of [-1,1] in both the Averages and HARUS datasets.


-------------------
###*Nominal-level Variables*

1\. subject <br />
subject (person) in the experiment <br />
>person label
>>>1-30

2\. activity <br />
physical activity of the subject
>activity type
>>WALKING <br />
>>WALKING\_UPSTAIRS <br />
>>WALKING\_DOWNSTAIRS <br />
>>SITTING <br />
>>STANDING <br />
>>LYING

###*Interval-level Variables*
3\. tBodyAccMeanX<br />
4\. tBodyAccMeanY<br /> 
5.	tBodyAccMeanZ <br /> 
6.	tBodyAccStdX <br /> 
7.	tBodyAccStdY <br /> 
8.	tBodyAccStdZ <br /> 
9.	tGravityAccMeanX <br /> 
10.	tGravityAccMeanY <br /> 
11.	tGravityAccMeanZ <br /> 
12.	tGravityAccStdX <br /> 
13.	tGravityAccStdY <br /> 
14.	tGravityAccStdZ <br /> 
15.	tBodyAccJerkMeanX <br /> 
16.	tBodyAccJerkMeanY <br /> 
17.	tBodyAccJerkMeanZ <br /> 
18.	tBodyAccJerkStdX <br /> 
19.	tBodyAccJerkStdY <br /> 
20.	tBodyAccJerkStdZ <br /> 
21.	tBodyGyroMeanX <br /> 
22.	tBodyGyroMeanY <br /> 
23.	tBodyGyroMeanZ <br /> 
24.	tBodyGyroStdX <br /> 
25.	tBodyGyroStdY <br /> 
26.	tBodyGyroStdZ <br /> 
27.	tBodyGyroJerkMeanX <br /> 
28.	tBodyGyroJerkMeanY <br /> 
29.	tBodyGyroJerkMeanZ <br /> 
30.	tBodyGyroJerkStdX <br /> 
31.	tBodyGyroJerkStdY <br /> 
32.	tBodyGyroJerkStdZ <br /> 
33.	tBodyAccMagMean <br /> 
34.	tBodyAccMagStd <br /> 
35.	tGravityAccMagMean <br /> 
36.	tGravityAccMagStd <br /> 
37.	tBodyAccJerkMagMean <br /> 
38.	tBodyAccJerkMagStd <br /> 
39.	tBodyGyroMagMean <br /> 
40.	tBodyGyroMagStd <br /> 
41.	tBodyGyroJerkMagMean <br /> 
42.	tBodyGyroJerkMagStd <br /> 
43.	fBodyAccMeanX <br /> 
44.	fBodyAccMeanY <br /> 
45.	fBodyAccMeanZ <br /> 
46.	fBodyAccStdX <br /> 
47.	fBodyAccStdY <br /> 
48.	fBodyAccStdZ <br /> 
49.	fBodyAccMeanFreqX <br /> 
50.	fBodyAccMeanFreqY <br /> 
51.	fBodyAccMeanFreqZ <br /> 
52.	fBodyAccJerkMeanX <br /> 
53.	fBodyAccJerkMeanY <br /> 
54.	fBodyAccJerkMeanZ <br /> 
55.	fBodyAccJerkStdX <br /> 
56.	fBodyAccJerkStdY <br /> 
57.	fBodyAccJerkStdZ <br /> 
58.	fBodyAccJerkMeanFreqX <br /> 
59.	fBodyAccJerkMeanFreqY <br /> 
60.	fBodyAccJerkMeanFreqZ <br /> 
61.	fBodyGyroMeanX <br /> 
62.	fBodyGyroMeanY <br /> 
63.	fBodyGyroMeanZ <br /> 
64.	fBodyGyroStdX <br /> 
65.	fBodyGyroStdY <br /> 
66.	fBodyGyroStdZ <br /> 
67.	fBodyGyroMeanFreqX <br /> 
68.	fBodyGyroMeanFreqY <br /> 
69.	fBodyGyroMeanFreqZ <br /> 
70.	fBodyAccMagMean <br /> 
71.	fBodyAccMagStd <br /> 
72.	fBodyAccMagMeanFreq <br /> 
73.	fBodyAccJerkMagMean <br /> 
74.	fBodyAccJerkMagStd <br /> 
75.	fBodyAccJerkMagMeanFreq <br /> 
76.	fBodyGyroMagMean <br /> 
77.	fBodyGyroMagStd <br /> 
78.	fBodyGyroMagMeanFreq <br /> 
79.	fBodyGyroJerkMagMean <br /> 
80.	fBodyGyroJerkMagStd <br /> 
81.	fBodyGyroJerkMagMeanFreq <br /> 