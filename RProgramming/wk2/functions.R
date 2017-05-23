##  ============================================
##  Functions Exercises from Week 2 Lectures
##  ============================================

##  Basic R Function adds two user-supplied arguments together.
##  
add2 <- function(x, y = 10) {
    x + y
}

##  Checks user argument and compares is to the math operation of the subset
##  object of the function (use).
##  
above10 <- function(x) {
    use <- x > 10
    x[use]
}

## Similar function as that above with a provided default value for argument
## "n".
## 
above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

##  Find the means of each column of the supplied matrix and remove the "NA"
##  values that are in the dataset from the results.
##
columnmean <- function(y, removeNA = TRUE) {
    nc = ncol(y) ## Calculates number of columns in the data provided in "y".
    means <- numeric(nc) ## Strict-type value of nc to be number.
    
    ## Iterate the loop to check each column.  Bascially this loop says
    ## for index located in the range of 1 to arbitrary value of "nc",
    ## means at index is equal (assigned to) the mean of the column.  It then
    ## returns the value of each column in "means".
    ## 
    for (i in 1:nc) {
        means[i] <- mean(y[, 1], na.rm = removeNA)
    }
    means
}

## Test function against the airquality data with the defaulted NA's removed.
##
columnmean(airquality)

## Test function against the airquality data with NA's added back...
## 
columnmean(airquality, FALSE)
