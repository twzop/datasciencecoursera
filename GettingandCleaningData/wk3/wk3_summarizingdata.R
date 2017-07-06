##==================================  
##  Week 3 - Summarizing Data
##==================================  
##  

setwd ("~/PROJECTS/datasciencecoursera/GettingandCleaningData/wk3/")

if (!file.exists ("./data")) {
    
    dir.create ("./data")
    
}

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file (fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv ("./data/restaurants.csv")

##  Summarizing the result ---
##  
head (restData, n = 3) ##   Shows top 3 rows of dataset ---

summary (restData)

str (restData)

quantile (restData$councilDistrict, na.rm = TRUE)

quantile (restData$councilDistrict, probs = c (0.5, 0.75, 0.9))

table (restData$zipCode, useNA = "ifany")
