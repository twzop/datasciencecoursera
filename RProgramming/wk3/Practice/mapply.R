# =================
# Using mapply
# =================

# mapply is a loop function that is a multivariate function that 
# applies a function in parallel to elemements in multiple 
# objects. Ex.  You can loop and use a function on multiple lists
# at the same time.

# How is mapply constructed?
str(mapply)

# * FUN is a function to apply
# * ... contains arguments to apply over (i.e. Lists to iterate)
# * MoreArgs is a list of other arguments to FUN
# * SIMPLIFY indicates whether the result should be simplified

#  Create a list repeating: 1 (4 times), 2 (3 times), 3 (2 times
# ) and 4 (1 time)
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

# We can do the exact same thing using mapply
mapply(rep, 1:4, 4:1) # take 1-4 and repeat each number 1 -4, 4 -1 times.. So:
# 1111 (4 repeats of 1)
# 222 (3 repeats of 2)
# 33 (2 repeats of 3)
# 4 (1 repeat of 4)

# ------------------------
# Vectorizing a Function
# ------------------------

# Instead of iterating like we want, this function only 
# applies normal random vars to the value of n, calculates the # mean of param 2 and then gives the standard dev of param 3
noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

noise(5, 1, 2)

noise(1:5, 1:5, 2)

# Providing a solution using mapply
mapply(noise, 1:5, 1:5, 2)
