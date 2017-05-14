# ===================================================
# *** Week 4 R Homework Programming Assignment ***
# ===================================================

# -----------------------------------
# The Rank All Hospitals Function
# -----------------------------------

rankall <- function (outcome, num = "best") {
  
  outcomeData <- read.csv ("outcome-of-care-measures.csv", colClasses = "character")
  
  state.outcomeData <- outcomeData[, 7]
  hospitalName.outcomeData <- outcomeData[, 2]
  heartAttack.outcomeData <- as.numeric (outcomeData[, 11])
  heartFailure.outcomeData <- outcomeData[, 17]
  pneumonia.outcomeData <- as.numeric (outcomeData[, 23])
  
  data.outcomeData <- data.frame (state.outcomeData, heartAttack.outcomeData, heartFailure.outcomeData, pneumonia.outcomeData, hospitalName.outcomeData)
  
  if (outcome == "heart attack") {
    sort.data.outcomeData <- data.outcomeData[order(state.outcomeData, heartAttack.outcomeData, hospitalName.outcomeData), ]
  } else if (outcome == "heart failure") {
    data.outcomeData$heartAttack.outcomeData <- NULL
    sort.data.outcomeData <- data.outcomeData[order(state.outcomeData, heartFailure.outcomeData, hospitalName.outcomeData), ]
  } else if (outcome == "pneumonia") {
    data.outcomeData$heartAttack.outcomeData <- NULL
    data.outcomeData$heartFailure.outcomeData <- NULL
    sort.data.outcomeData <- data.outcomeData[order(state.outcomeData, pneumonia.outcomeData, hospitalName.outcomeData), ]
  } else {
    stop ("invalid outcome")
  }
  
  sort.data.outcomeData <- sort.data.outcomeData[complete.cases(sort.data.outcomeData), ]
}