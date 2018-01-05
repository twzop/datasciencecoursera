##==============================
##  Week 3 Practice Exercise  
##==============================  

##  Establish working directory
setwd("C:/Users/soloc/OneDrive/Documents/PROJECTS/datasciencecoursera/RProgramming/wk3/practice")

## Pull in assignment from web and unzip in-place
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")

##  Extract files to "diet_data" directory
unzip("diet_data", exdir = "diet_data")

##  List unzipped files in "diet_data" directory
list.files("diet_data")

andy <- read.csv("diet_data/Andy.csv", header = T)
head(andy)

##  Look to see how many rows are in the "Day" column of andy
length(andy$Day)

##  Alternate method for doing the same above (Shows 30 rows and 4 columns)
dim(andy)

## Run some other commands to give us some details about the andy data file
str(andy)
summary(andy)
names(andy)

##  Show Andy's first weight
andy[1, "Weight"]
##  Show Andy's last weight
andy[30, "Weight"]

## Alternate method for doing the same as above
andy[which(andy$Day == 1), "Weight"]
andy[which(andy$Day == 30), "Weight"]
##  Yet another method using subset
subset(andy$Weight, andy$Day == 30)

##  Assign Andy's start and end weight to vectors
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

##  Find out how much weight Andy loss from the start to end dates
andy_loss <- andy_start - andy_end
print(andy_loss)

## You can also do the exact same thing above using subset()
andy_start <- subset(andy$Weight, andy$Day == 1)
andy_end <- subset(andy$Weight, andy$Day == 30)
andy_loss <- andy_start - andy_end
print(andy_loss)
## -- This resulted in Andy losing (5) lbs over the course of (30) days.

## Store the output of list.files() in a vector array
files <- list.files("diet_data")
## Show the file names contained in the directory named "diet_data"
print(files)

## We can also subset these
files[1]
files[2]
files[3:5]

typeof(files)
str(files)

##  Call specific files by index
files[1:length(files)]

## Append subdirectory name to the files in the files array so that read.csv() can properly read file
files_full <- list.files("diet_data", full.names = T)
print(files_full)

## Now, let's take a quick peek at John.csv
head(read.csv(files_full[3])) ## Same as John.csv

## If we want to create one large dataframe with all csv files rolled into one dataset, we need rbind() and a logical loop to accomplish this

## Create a new dataframe and bind david's data to andy's to the right (appending)
andy_david <- rbind(andy, read.csv(files_full[2]))

## When we look at the head() and tail() of our new dataframe, we can see that David's information has been appended to Andy's (look at Name column)
head(andy_david)
tail(andy_david)

## Show just the 25th day value for Andy and David's dataset
day_25 <- subset(andy_david, andy_david$Day == 25)
print(day_25)

## We now want to bind everyone else's data to this dataset so the best way to do that in terms of effenciency is to use an iterative loop
## A loop Ex.
for (i in 1:5) {
  print(i)
}

## Let's apply the above loop concept to the csv data files in our directory.  Our dataframe needs to be created first before we bind to it.
dat <- data.frame()
for (i in 1:length(files_full)) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)

## Now that we have all files in here, we want the median weight value -- excluding NA's.
answer <- paste0(median(dat$Weight, na.rm = T), " lbs is the median weight.")
print(answer)

## Let's now find the median weight of day 30 by taking a subset
dat_30 <- subset(dat$Weight, dat$Day == 30)
print(dat_30)
median(dat_30)


## Let's now build a function that will return the median weight of a given day.
## We'll start by defining two params: 1.) The directory of the data and 2.) the day for which they want to calculate the median.

weightmedian <- function (directory, day) {
  
  ## Creates a list of files
  files_list <- list.files(directory, full.names = T)
  dat <- data.frame()
  for (i in 1:length(files_list)) {
    ## loops through the files, rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  ## subsets the rows of the "Day" column that match the "day" argument
  dat_subset <- dat[which(dat[, "Day"] == day),]
  ## identifies the median weight of the previous subset of dat while stripping NA's
  median(dat_subset[, "Weight"], na.rm = T)
  
}


## Now test the function agains custom params
weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)


# The above approach for creating a dataframe object and
# iterating it in the loops is not a good method due to
# performance.  Let's do it a better way below.

# Create an empty string that's the length of the expected output. input: files_full and empty list: tmp.

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)
str(tmp)

# We just read in each of the csv files and placed them inside of the list.  Now, we have a list of (5) elements called tmp, where each element of the list is a dataframe containing one of the csv files.  Doing this functionally is the same as using lapply.
str(lapply(files_full, read.csv))

# We still need to go from a list to a single dataframe
str(tmp[[1]])
head(tmp[[1]][,"Day"])
