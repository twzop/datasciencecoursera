# =============
# Using Split
# =============

# Split is similar to tapply, but doesn't apply summary statistics.  It splits a vector or object into n number of groups determined by a factor or a list of factors

str(split)

# Vector with (10) normals w/ mean of 0, (10) uniformed random vars w/ mean of 0 and (10) normal random vars with a mean of 1
x <- c(rnorm(10), runif(10), rnorm(10, 1))
print(x)

# vector of factor var
f <- gl(3, 10)
print(f)

# The split of the x vector yields a list of three parts that represents the three sections containing val types as defined in the original x
split(x, f)


# Typically you split first and then run lapply on the list split returns

# We can use split on more complicated types of objects such as a dataframe
library(datasets)
head(airquality)


# If I want to calculate the mean of Ozone, Solar Radiation, Wind and Temp for each month, I can split the dataframe into monthly pieces, and then calc the means using apply
s <- split(airquality, airquality$Month)
print(s)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

# Can also call sapply to have a simplified matrix returned
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = T))

# ----------------------------------
# Splitting on more than one level
# ----------------------------------

# You would split more than one level when you wanted to see data from say Male vs. Female in a dataset and then further Hispanic vs. Asian.

x <- rnorm(10)
f1 <- gl(2,5) # (2) Levels repeated (5) times
f2 <- gl(5,2) # (5) Levels repeated (2) times
print(f1)
print(f2)

# We can use interaction() to concatinate these factors together into one
interaction(f1,f2)

# We can use split to x according to the two factor levels
str(split(x, list(f1,f2)))
