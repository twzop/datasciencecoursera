# =============
# Using apply
# =============

# apply is used to evaluate a function over the margins of an 
# array
# --------------------------------------------------------------
# * Often used to apply a function to rows or cols of a matrix
#
# * Can be used with general arrays (taking AVG of matricies)
#
# * No faster than writing a loop, but works in one line of code
# --------------------------------------------------------------

# Show structure of apply() function
str(apply)

# Let's use apply on a matrix of 10 cols and 20 rows of 200 
# random normal values
x <- matrix(rnorm(200), 20, 10)
print(x)
# By specifying 2, you are selecting all cols in the matrix and 
# omitting dimension 1 -- which are the rows.  We see means of 
# all cols in the matrix with a vector as output
apply(x, 2, mean)

# Similarily, we can show sums of each row and not cols
apply(x, 1, sum)


# If we happen to have a matrix with 200 random normal variables
# , 20 rows with 10 columns and I want to know the 25th and the 
# 75th percentile of each row of x using the quantile function, 
# I'd do the following:
apply(x, 1, quantile, probs = c(0.25, 0.75))

# Average of matrix in an array
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
print(a)
apply(a, c(1, 2), mean) # keep 1st and 2nd dimensions, but collapse 3rd

rowMeans(a, dims = 2)

