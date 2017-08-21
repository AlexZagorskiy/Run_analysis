#This sctript fulfills (hopefully) requirements of Assignment 2 for Data Science Course 3
##Downloading and unpacking the data
siteUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("assign2.zip"))download.file(siteUrl,destfile = "assign2.zip", mode="wb")
if(!dir.exists("UCI HAR Dataset")){
unzip("assign2.zip", files = NULL, list = FALSE, overwrite = TRUE,
         junkpaths = FALSE, exdir = ".", unzip = "internal",
         setTimes = FALSE)}

##Reading training dataset
dir_tr="UCI HAR Dataset\\train\\"
dat_train<-read.table(paste(dir_tr, "X_train.txt",sep=""))
labels_train<-read.table(paste(dir_tr, "y_train.txt",sep=""),colClasses = "factor")
subject_train<-read.table(paste(dir_tr, "subject_train.txt",sep=""))

##Reading test dataset
dir_test="UCI HAR Dataset\\test\\"
dat_test<-read.table(paste(dir_test, "X_test.txt",sep=""))
labels_test<-read.table(paste(dir_test, "y_test.txt",sep=""),colClasses = "factor")
subject_test<-read.table(paste(dir_test, "subject_test.txt",sep=""))

##reading common for both datasets info
features<-read.table(file="UCI HAR Dataset\\features.txt",sep="")
activity_lables<-read.table(file="UCI HAR Dataset\\activity_labels.txt",sep="")

##merging datasets
dat<-rbind(dat_train, dat_test)
labels<-rbind(labels_train,labels_test)
subjects<-rbind(subject_train,subject_test) 


##Subsetting dataset by extracting columns with means and stds only
needed_cols<-grepl("mean", features[,2]) | grepl("std", features[,2])
dat<-dat[,needed_cols]

##Tiding up and attaching activity names, labels and subjects
        for(i in 1:6){
        labels[,1]<-sub(activity_lables[i,1],activity_lables[i,2], labels[,1])
        }
dat<-cbind(subjects[,1],labels[,1], dat)
names_inter<-gsub("()","", features[,2],fixed=TRUE)
names(dat)<-c("subjects", "labels", as.character(names_inter[needed_cols]))

        
##THis function generates averages over the Activity for a given dataframe column
        fun<-function(dat, subj , j ){
        tapply(as.vector(dat[dat$subjects==subj, j]), 
                         dat$labels[dat$subjects==subj], mean)      
        }
        
##generating a resulting dataset of averages for Activities and Subjects
a<-3:dim(dat)[2]   ## columns to average
dat_result<-data.frame()
        for (j in 1:max(dat$subjects)){      ## looping over subjects
                interim<-sapply(X=a,FUN=fun, dat=dat, subj=j, simplify=TRUE)
                xx<-cbind(rep(j,6), row.names(interim),interim)
                dat_result<-rbind(dat_result,xx)
        }
names(dat_result)<-names(dat)
        
##if(!file.exists("analysis_dataset.txt"))
        write.table(dat_result, file="analysis_dataset.txt", row.names=FALSE,quote = FALSE)
       
        ##control: ww<-read.table(file="assign2.txt",  colClasses = "character") 
         