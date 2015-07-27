#setwd("C:/Users/Madine/Desktop/Data Science/Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

library(reshape)
library(reshape2)
library(plyr)
library(dplyr)

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)

table1 <- rbind(train,test)

names(table1) <- c("Subject_ID","Activity_ID", as.character(features$V2))
names(table1) <- make.unique(names(table1))

meann <- select(table1, contains("mean()"))
std <- select(table1, contains("std()"))

vars <- c(colnames(meann),colnames(std))
vars <- gsub("-","_",vars)
vars <- gsub("()","",vars)

table2 <- cbind(table1[,c(1,2)], meann, std)

table2$Activity_ID <- factor(table2$Activity_ID, levels=c('1','2','3','4','5','6'),
               labels=c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

names(table2) <- gsub("-","_",names(table2))
names(table2) <- gsub("()","",names(table2))

tablemelt <- melt(table2, id=c("Subject_ID","Activity_ID"), measure.vars=vars)

tidytable <- dcast(tablemelt, Subject_ID + Activity_ID ~ variable, mean)
