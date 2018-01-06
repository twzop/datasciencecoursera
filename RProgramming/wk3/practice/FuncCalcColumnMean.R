# =================================================
# Calculate the mean from each col in a function
# =================================================

columnmean <- function (y, removeNA = T) {
  nc <- ncol(y)
  means <- numeric(nc) # Empty vector that's numeric
  
  for (i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
}

# Test Air Quality Data Set
columnmean(airquality)
