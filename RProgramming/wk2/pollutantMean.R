##  =============================
##  Pollution Mean Function
##  =============================

##  ----------------------------  
##  1. Pollution Mean Function
##  ----------------------------
##  
##  This function calculates the mean of a pollutant (sulfate or nitrate)
##  across a specified list of monitors.  It takes (3) arguments:
##  'directory', 'pollutant', and 'id'.  Given a vector monitor ID
##  number, pollutant mean of the pollutant across all of the monitors,
##  ignoring any missing vales coded as NA.
##

## Set Working Directory (Globally)
##
setwd("~/PROJECTS/datasciencecoursera/RProgramming/wk2/")

pollutantmean <- function (directory, pollutant, id = 1:332) {
    
    ## Generate a list of files in the dir to process
    ## 
    fileList <- list.files (directory, full.names = TRUE)
    monitorData <- data.frame ()
    
    ## Iterate through files in the directory and concatinate their values
    ## into the empty dataframe.
    ## 
    for (n in id) {
        tfile <- read.csv(fileList[n], header = TRUE)
        monitorData <- rbind(monitorData, tfile)
    }
    
    ## Calculate the mean of pollutans and remove the NA vals
    ## and return the value to global env from this function.
    ## 
    return (mean (monitorData[pollutant], na.rm = TRUE))
    
}

##  --------------------------
##  2.  Function Complete
##  --------------------------
##  
##  This function reports the number of completely observed cases and
##  returns a dataframe where the first column is the anme of the file
##  and the second column is the number of complete cases.
##  
completeData <- function (directory, id = 1:332) {
    
    ## Generate a list of files in the dir to process
    ## 
    fileList <- list.files (directory, full.names = TRUE)
    monitorData <- data.frame ()
    
    for (n in id) {
        tfile <-read.csv (fileList[n], header = TRUE)
        tfile <- na.omit (tfile)
        
        ## Count rows with complete cases
        ## 
        tfileNOBs <- nrow (tfile)
        
        monitorData <- rbind (monitorData, data.frame (n, tfileNOBs))
    }
    
    return (monitorData)
    
}

##  ---------------------------
##  3.  Function Correlation
##  ---------------------------
##  
##  This function takes a directory with data files and a threshold
##  for complete cases and calculates the correlation between sulfate
##  and nitrate for monitor locations where the number of completely 
##  observed cases is greater than the threshold.  This function should
##  return a numeric vector of length zero.
##  
correlation <- function (directory, threshold = 0) {
    
    fileList <- list.files (directory, full.names = TRUE)
    
    monitorData <- vector (mode = "numeric", length = 0)
    
    for (n in 1:length (monitorData)) {
        
        tfile <- read.csv (monitorData[n], header = TRUE)
        tfile <- tfile[complete.cases (tfile),]
        columnSum <- nrow (tfile)
        
        if (columnSum > threshold) {
            
            monitorData <- c (monitorData, correlation (tfile$nitrate, tfile$sulfate))
            
        }
        
    }
    
    return (monitorData)
    
}