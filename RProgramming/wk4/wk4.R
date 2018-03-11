## ===================
## Week 4 Exercises
## CLEANING DATA
## ===================

## ** Fixing character vectors using tolower() and toupper()

## Create dir if not exists
if(!file.exists("data/")) {dir.create("data")}
## Set var for data file url
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?acessType=DOWNLOAD"
## Pull datafile down to local dir
download.file(fileUrl, destfile = "data/cameras.csv", method = "curl")

## Declare var for csv file
cameraData <- read.csv("data/cameras.csv", header = T, sep = ",", check.names = T)
## Show column names of the dataset
colnames(cameraData)

## use tolower() to standardize all names to lowercase (removes caps and camelcase)
colnames(cameraData) <- tolower(colnames(cameraData))
colnames(cameraData)


## Cleaning lists to subset data
mylist <- list(letters = c("A", "B", "C", "D"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)

## Download new sets
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "data/reviews.csv", method = "curl")
download.file(fileUrl2, destfile = "data/solutions.csv", method = "curl")

## Both paths for datasets return 404 errors

reviews <- read.csv("data/reviews.csv", header = T, check.names = T, sep = ","); solutions <- read.csv("data/solutions.csv", header = T, check.names = T, sep = ",")

head(reviews,2)
head(reviews)
