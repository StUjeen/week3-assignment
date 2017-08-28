library(dplyr)
library(reshape2)
#to set working dirrectory use this template:
#setwd("C:/uci har dataset/")

##***DATASETS LOADING***
#get paths of datasets 
drs <- list.dirs(".", recursive = F, full.names = T)
flist <- sapply(drs
                , list.files
                , pattern = "^X+(.*)+txt$"
                , full.names = T
                , recursive = F
                )
#simplify path strings
flist <- as.character(flist, stringsAsFactors = F)
#get variables names for datasets
varnames <- read.table("./features.txt", stringsAsFactors = F)
varnames <- varnames$V2
#read datasets from files
wdth <- rep(16, each = 561)
dset <- lapply(flist, read.fwf, width = wdth, col.names = varnames)
#join list elements to a data frame with new column set_src (test; train)
i <-1
dset2 <- list()
while (i <= length(drs)) {
  xx <- dset[[i]]
  xx <- mutate(xx, set_src = drs[i])
  dset2 <-rbind(dset2,xx)
  i <- i+1
}
#get paths to "subject" and "label" files
flist1 <- sapply(drs
                , list.files
                , pattern = "txt$"
                , full.names = T
                )
flist1 <- as.character(flist1, stringsAsFactors = F)
flist1 <- subset(flist1, !grepl("/+X+_",flist1))
#read files of subjects and labels
dset <- lapply(flist1, read.table)
names(dset) <- flist1
#join list elements to a data frame
i <-1
dset3 <- list()
while (i <= length(drs)) {
  xx <- subset(dset, grepl(drs[i],flist1))
  xx <- as.data.frame(xx)
  names(xx) <- c("subject","label")
  dset3 <-rbind(dset3,xx)
  i <- i+1
}
#join the dataset, label and subject
dset <- cbind(dset3,dset2)
#remove junk objects
rm(xx, dset2, dset3, drs, flist, flist1, i, wdth)

##***THE DATASET PREPARATION***
#subset only stds and means from the varnames
varnames <- subset(varnames, grepl("(.*)[Mm]ean(.*)", varnames) 
                    | grepl("(.*)[Ss]td(.*)",varnames))
#add to varnames new elements, "subject" and "lable"
varnames <- c("subject", "label", varnames)
dset1 <- select(dset, as.factor(varnames))
#add activity names
activity <- read.table("./activity_labels.txt"
                       , col.names = c("id","label_name")
                       , stringsAsFactors = F)
dset1 <- merge(dset1, activity, by.x = "label", by.y = "id", sort = F)

##***THE DATASET TIDYING***
#convert to a data table format
dset3<- tbl_df(dset1)
#melt data table to a long format table
dset_m <- melt(dset3, id = c("subject", "label", "label_name"))
dset_m <- select(dset_m, -label)
#group molten dt by subject, label and type of measurement
dset_gb <- group_by(dset_m, subject, label_name, variable)
#calculate mean for grouped dt
dset_res <- summarise(dset_gb, mean_value = mean(value))

##***CREATE PEER-GRADED ASSIGNMENT RESULTS***
write.table(dset_res, paste(getwd(),"/res.txt", sep =""), row.names = F)