# ===============
# Using sapply
# ===============

# sapply is a variant of lappy that simplifies the result of 
# lapply if possible (lists to vectors as result type)

# So, when we used the following with lapply to get a list back 
# with all of the different subsets, sapply would have given us 
# the same output, but in a single vector

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
str(x) # x is a list

# now apply sapply to this same list
# x stays a list, but the output is a single vector
sapply(x, mean)

