# ==============
# Using tapply
# ==============

# tapply is used to iterate functions over a subset of a vector
# Let's look at the function
str(tapply)
# Output: function (X, INDEX, FUN = NULL, ..., simplify = T)
# Where:
# * X is a vector
# * INDEX is a factor or a list of factors (that become coerced
#   to factors)
# * FUN is a function to be applied
# * ... contains other arguments to be passed to FUN
# * simplify is an optional bool param that asks if the result 
#   should be simplifed or not

# This is good to see which observations in a group are men and women

# Examples
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
print(f)
tapply(x, f, mean)
