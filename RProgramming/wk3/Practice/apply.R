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

