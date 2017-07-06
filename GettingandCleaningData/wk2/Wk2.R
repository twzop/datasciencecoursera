##===============================================
##  Coursera Getting and Cleaning Data Course
##-----------------------------------------------
##  Week 2 of 4
##===============================================

##  Set working directory ---
##  
setwd ("~/PROJECTS/datasciencecoursera/GettingandCleaningData/wk2")

##  Check, install and load dependencies
##  
checkPackages <- function (pkg = packages) {
    
    new.pkg <- pkg[!(pkg %in% installed.packages ()[, "Package"])]
    
    if (length (new.pkg)) {
        install.packages (new.pkg, dependencies = TRUE)
        
    } else {
        sapply (pkg, require, character.only = TRUE)
        
    }
    
}

##  Run Function Check and then load
##  
packages <- c ("RMySQL")

checkPackages (packages)

##  ---

##  Connect to the UC Santa Cruiz public SQL database ---
##  
ucscDb <- dbConnect (
    
    MySQL (),
    user = "genome",
    host = "genome-mysql.cse.ucsc.edu"
    
    )

result <- dbGetQuery (
    
    ucscDb,
    "show databases;"
    
);

dbDisconnect (ucscDb)

##  ---


##  Unload packages from memory ---
##  
detach ("package:RMySQL")