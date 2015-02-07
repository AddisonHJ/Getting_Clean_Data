# Getting\_Clean_Data
This repository includes the following files:

* README.md : describes the R script to produce the 'Averages' dataset and provides advice on reading the Averages.txt file (provided on Coursera site) into R
* codebook.md : describes the 'Averages' dataset and its source, the HARUS dataset
* run_analysis.R : programmatically extracts desired data from the HARUS dataset and creates the 'Averages' dataset

## run_analysis.R

The **run_analysis.R** file is part of my course project for the Getting and Cleaning Data course, which is part of the Data Science specialisation, on Coursera. 

**Approach**
My approach reflects the fact that I began programming with this Data Science specialisation, with the Data Scientist's Toolbox and R Programming courses. I adopt the methods taught so far, eschewing any exotic variations that might be suggested by experienced programmers on Source Forge and other forums. At my current level, I prefer a line of code for each step rather than many shortcuts so that when I view the script in the future, the code still makes sense to me. However, I wish to avoid excessive repetition. There are two parts of my **run_analysis.R** script that I believe could be shortened, but I couldn't figure out how to do it within a reasonable amount of time. I point out these parts below and obviously welcome any advice.

##The Coding Steps

**General notes**

 * whenever an object is no longer needed, it is removed from the environment to keep the workspace tidy
 * this script requires installation of the **dplyr** package
 * I did not use the **data.table** package for data frame operations, despite its being faster, because I wanted to gain familiarity with data frame operations in the base R package, since the dataset for my own PhD project is much smaller than the one used here

**Set the working directory and create folder for the Samsung data**

 * create on desktop

**Download and unzip the data files**

 * include date downloaded, as instructor advised
 * remove the redundant zip file

**Read the relevant text files into R**

 * *This is the first part that needs to be more efficient, I think.* An iterative function should read the txt files into R, avoiding repetition of the `read.table` function.
 * working directory is temporarily set to a lower-level folder to avoid long, repetitious file names, and then set back

**Task 1: a) Merge the data to create 2 labelled datasets for the training and test cases; b) Merge the train and test datasets**

 * it's interesting to note that R does not update the variable names. The final **DataFrame** at this point has 3 columns labeled "V1"

**Task 2: Extract variables that measure mean and standard deviation**

 * create a logical vector, **RelVars**, based on the evaluation of column 2 of the **features** dataframe. `grepl` function returns TRUE for every element that contains "mean" or "std".
 * Note: I did not extract the 6 "angle" variables (nos. 555-561) because these are not measures of means or standard deviations, but rather of the angle between (presumably) 2 vectors of raw measurements. I have zero substantive understanding of the domain for which these data were generated, but it seems to me that the word 'mean' in these feature names comes from the name of vectors in the angle measurement.
 * concatenate 2 additional 'TRUE' values at the start of **RelVars** to account for the 2 additional columns in **DataFrame**
 * use the resulting vector **RelVarsAll** to extract the relevant variables. (Now R gives unique labels to the first 3 columns.)

**Task 3: Replace activity numbers with descriptive names**

* Note: the researchers use the activity label 'LAYING', which is ungrammatical. 'LAYING' is a transitive verb. The correct verb is 'LYING'. I change it.
* use an interative control structure to loop through all 6 values of variable "V1.1" in **DataFrame** and substitute the activity numbers with the descriptive labels provided in column 2 of the **activity_labels** dataframe. Use transform so that the object returned is the entire **DataFrame**, not a vector.

**Task 4: Label the dataset with descriptive variable names**

* extract the variable names containing "mean" and "std" from the **features** dataframe into a character vector **FeatureNames**
* perform some edits on these names to make them legal in R and remove the typo "BodyBody" in some variable names. *This is the 2nd part that requires improvement, I think. How to make multiple text substitutions more efficiently?* 
* concatenate variable names "subject" and "activity" at the start of **FeatureNames**
* use this vector to define the names of **DataFrame**
* Note: I interpret this task as primarily one of attaching the feature names provided by the researchers to the merged and reduced-variable **DataFrame**. I chose not to unpack labels such as 't','f' or 'Acc'. I believe that variable names should be descriptive enough for persons having adequate domain knowledge to understand the variable; they should not be so descriptive to be excessively long or serve the role of the Code Book. In this task, the most important step was making them legal in R.

**Task 5: Create new dataset with variable averages for each subject & activity**

* group **DataFrame** first by subject, then by activity
* summarise each variable by calculating the mean within subject-activity groups and save the new dataframe as **Averages** and view it.
* the **Averages** dataset is tidy, as defined by Wickham (2014)\*, in that:

> * each observation (subject-activity combination) forms a row
* each variable forms a column and each column contains only one variable
* observational units of the same type (subject-activity measured at an aggregated level, namely the means of lower-level measures of individual actions) are stored in one table
* the table contains only this type of observational unit and no units at the lower level of aggregation.

\*Wickham, Hadley (2014), "Tidy Data", *Journal of Statistical Software* (59:10).

##Note on Reading the Averages.txt File into R

This file is available to reviewers on the Coursera Getting and Cleaning Data course website. 
The **Averages** dataframe was written to a .txt file using `write.table` with `row.name = FALSE`. To read it into R, use the following code:

`Averages <- read.table("Averages.txt", header = TRUE)`