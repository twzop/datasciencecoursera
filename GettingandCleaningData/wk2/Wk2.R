##===============================================
##  Coursera Getting and Cleaning Data Course
##-----------------------------------------------
##
##  Week 2 of 4
##  
##===============================================

##  Set working directory ---
##  
setwd ("~/PROJECTS/datasciencecoursera/GettingandCleaningData/wk2")

##  Check dependencies ---
##  
list.packages <- c ("RMySQL")

check.new.package <- function (p = list.packages) {
    
    new.packages <-
        list.packages[!(list.packages %in% installed.packages ()[, "Packages"])]
        if (length (new.packages)) {
            
            install.packages (new.packages)
            require (new.packages)
            
        } 
        else {
            
            require (list.packages)
            
        }
    
}

##  ----------------------------------------------

##  Connect to the UC Santa Cruiz public SQL database ---
##  
