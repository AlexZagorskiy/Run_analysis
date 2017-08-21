# Run_analysis

This repo contains the files related to the Assignment 2 of the "Getting and cleaning data" course
## File "Run_analysis.R":
        --Contains an R script, which was used to to download the original dataset,transform it and write the resulting one
        --the working directory should contain a file named "assign2.zip" downloaded from the original source, 
        otherwise the script will download the original archive uder this name. 
        -- if the directory "UCI HAR Dataset" does not exist, the script will unpack the archive 
        and create the directory with the needed subfolders
        --detais: 1.	Downloading the original dataset and unpacking the files. The resulting folder structures looks as following
 

2.	Reading the training and test datasets X_test.txt and X_train.txt files and the 
corresponding y_test.txt and y_train.txt files containing the activity  labels 
and the subject_train.txt and subject_test.txt files containing the subject identification data. 
3.	Reading the activity identification table activity_labels.txt and names of the variables features.txt .
4.	X_.., y_. subject_. and subject_.  train and test data  frames are merged, numerical 
activities ids are substituted with their verbal equivalents, then the subject and labels 
variables were attached to the FFT variables data frame from the left.  
5.	Names containing "mean" and "std" character sequences are identified 
and corresponding subset of the  merged data frame is made. Corresponding (selected) 
ames are assigned to the data frame columns. Characters sequence "()" is removed from the names. 
6.	Averages over the activities and subjects are generated and resulting dataset 
is written into the file "analysis_dataset.txt" with the following structure (subjects, 
activity labels and 79 data columns):
            subjects             labels  	 tBodyAcc-mean-X      tBodyAcc-mean-Y    		 tBodyAcc-mean-Z ..
                   1          	   LAYING  	  0.22159824394 	    -0.0405139534294     	 -0.11320355358  ....
                   1         	   SITTING	  0.261237565425532     -0.00130828765170213            -0.104544182255319...
                   1        	   STANDING	 0.278917629056604 	    -0.0161375901037736 	 -0.110601817735849 ..
                   1         	   WALKING	 0.277330758736842	  -0.0173838185273684 	 -0.111148103547368 ...
Description of each variable is given further in the "present document"Cook_book" document. 

## File "code_book.pdf":
        --Contains all the information about the data orign, data transformation procedures 
        and the structuire of the resulting dataset
## File "analysis_dataset.txt"
        --contains the resulting dataset
All the files are review-ready          
