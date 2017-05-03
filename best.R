# ===================================================
# *** Week 4 R Homework Programming Assignment ***
# ===================================================

# -----------------------------
# The Best Hospital Function
# -----------------------------

# DESC: The below function "best" returns a character vector with the
# name of the best (i.e. "lowest" 30-day mortality rated) hospital 
# for the specified outcome in the specified state.

# The best function takes (2) arguments:
# 1.) A 2-character abbreviated name for a state
# 2.) An outcome name

best <- function (state, outcome) {
  
  # Read outcome data
  # check that state and outcome are valid
  # Return hospital name in that state with lowest 30-day death rate
  
  # Set var for directory where csv file lives
  dir <- "outcome-of-care-measures.csv"
  
  # Read "outcome-of-care-measures.csv" file
  outcomeData <- read.csv(dir, colClasses = "character")
  
  state.outcomeData <- outcomeData[, 7]
  data.outcomeData <- c("heart attack", "heart failure", "pneumonia")
  
  # Error Handling
  if (!state %in% state.outcomeData) {
    stop (print ("invalid state"))
  } else if (!outcome %in% data.outcomeData) {
    stop (print ("invalid outcome"))
  }
  
  subset_outcomeData <- subset(outcomeData, State == state)
  
  # Match user input to col data and assign val if there is a match
  if (outcome == "heart attack") {
    output.outcomeData <- 11
  } else if (outcome == "heart failure") {
    output.outcomeData <- 17
  } else {
    output.outcomeData <- 23
  }
  
  # sanitize output
  output.data <- as.numeric(subset_outcomeData[, output.outcomeData])
  noNA <- is.na(output.data)
  clean <- subset_outcomeData[!noNA, ]
  
  minCols <- as.numeric(clean[, output.outcomeData])
  minRows <- which(minCols == min(minCols)) # identify which cols are smallest
  minHospital <- clean[minRows, 2]
  
  # return ASC sorted hospitals if multiple vals are returned
  if (length(minHospital) > 1) {
    sorted.minHospital <- sort(minHospital) #if more than one val returned; sort
  } else {
    minHospital
  }
  
}
