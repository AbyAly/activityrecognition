# activityrecognition
For getting and cleaning project assignment

How the run_analysis.R script works.

The script works through the 5 steps described in the project assignment task. For each step there are certain R commands to execute the steps. 
Things to ensure before running the script.

1. You are in the directory where data files are located including both test and train folders. It is named as "UCI_HAR_Dataset".
2. You have downloaded PLYR tool.


Step 1: MERGES THE TRAINING AND THE TEST DATA SETS INTO ONE DATA SET
First, we are reading the test, train and subject data sets through read.table command and putting these into certain varibales like x_train, x_test and so on.
Secondly, we need to join the two sets of 'x' data in one. i,e, x_train and x_test. We are doing it through a simple rbind command. 
Thirdly, we repeat the same joining for the 'y' and 'subject' to get one data file for each of x, y and subject data. 


STEP 2: IN THIS STEP WE NEED TO FILTER ONLY THE MEAN AND SD VARIABLES FROM THE 561 RECORDS
First, we need to read the 'features' data which shows the statistics measured such as mean, sd and so on. 
Secondly, we are using the 'grep' command to identify rows which have 'mean' OR 'std' mentioned in the variable names and putting these filtered rows in a new variable called 'mean_and_std_features'
Thirdly, we are filtering the x_data to keep the columns which have 'mean' and 'std'
Fourthly, we are simply renaming the columns of x_data as per the actual 'names' mentioned in their respective columns in 'features' file


STEP 3: HERE ARE ARE USING DESCRIPTIVE NAMES OF THE ACITVITIES LIKE LAYING, STANDING ETC. 
First, we need to reach the actual 6 lables from the 'acitvity.txt' file
Secondly, we are filtering the column y data for the first row
Thirdly, we are simply passing on the 'activity' names to the first row of 'y' data to rename properly 
 
STEP 4: WE NOW NEED TO LABEL THE DATA SET
Firstly, we are labeling the column names themselves by passing the 'subject' data to the combined 'subject_data' file
Secondly, we are now ready to combine ALL the combined x, y, and subject data into one data.frame file called all_data

STEP 5: NOW THE WORK STARTS ON THE COMBINED DATA, TO GET THE TIDY DATA AS REQUIRED
First, we need to have 'averages' for the activity and subject data. So we use ddply, could use tapply also.
Secondly, we are ready to write the averages data into a .txt' file 

