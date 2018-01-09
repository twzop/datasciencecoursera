# ======================================
# Using Looping Functions apply family
# ======================================

# lapply loops a function across a list.  If the item being evaluated is not a list, lapply will try to convert it to a list

x <- list(a = 1.5, b = rnorm(10))
lapply(x, mean) # apply the mean function to the list x

# Run runif() across the iteration of x with lapply
x <- 1:4
lapply(x, runif) # will be the same as runif(1), runif(2), runif(3), runif(4)

# Use lappy on a more complex list
x <- list(a = 1:4, b = rnorm(10), c = rnorm(10, 1), d = rnorm(100, 5))
lapply(x, mean)

# Use lappy on list with runif() function where we generate a 
# uniform of 0 - 10 verses the default of 0 -1
x <- 1:4
lapply(x, runif, min = 0, max = 10)


# Use lapply to extract a column from each of the multiple
# column matricies
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
print(x)
# In order to do this, we create an anon function and define it 
#right in the statement of the lappy or we call a predefined 
#named function
lapply(x, function(elt) elt[,1]) # Extract each first col in each row of x

