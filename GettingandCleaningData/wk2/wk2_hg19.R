##====================================  
##  CONNECT TO SPECIFIC DB hg19 - WK 2
##====================================

setwd ("~/PROJECTS/datasciencecoursera/GettingandCleaningData/wk2/")

##  Dependency check, install and load function ---
##  
checkpackages <- function (pkg) {
    
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    
    if (length (new.pkg)) {
        install.packages (new.pkg, dependencies = TRUE)
        
    } else {
        sapply (pkg, require, character.only = TRUE)
        
    }
    
}

##  Create package list ---
##  
packages <- c ("RMySQL")
##  Instantiate function for check against 
##  the packages list ---
##  
checkpackages (packages)

##  ---
##  

##  Connect to Database hg19 ---
##  
hg19 <- dbConnect (
    MySQL (),
    user = "genome",
    db = "hg19",
    host = "genome-mysql.cse.ucsc.edu"
)

##-------------------------------------------  
##  Sample DB and table operations examples
##-------------------------------------------
##  

##  Show Tables from the above db hg19 ---
##  
allTables <- dbListTables (hg19)
length (allTables)

##  Show fields in the table "affyU133Plus2" ---
##  
dbGetQuery (
    hg19, 
    "SELECT COUNT(*) FROM `affyU133Plus2`"
)

##  Reading data from a MySQL table ---
##  
affyData <- dbReadTable (
    hg19,
    "`affyU133Plus2`"
)
head (affyData)

##  Select a subset of data from a certain db ---
##  
query <- dbSendQuery (
    hg19,
    "SELECT * FROM `affyU133Plus2` WHERE `misMatches` BETWEEN 1 AND 3"
)
affyMis <- fetch (query); quantile (affyMis$misMatches)

##  If you only want to return a small number of 
##  records from a table versus the entire result,
##  you can...
##  
affyMisSmall <- fetch (
    query,
    n = 10
);

##  Need to clear queries from our connection ---
##  
dbClearResult (query);


##  ---
##  Remove package from R environment ---
##  ---
##  
detach ("package:RMySQL")

