# ==============================================================
# Determine by using a function which elements of a vector are
# valued greater than the number 10.
# ==============================================================

# First, we'll start by making a general function that adds the two params supplied
add2 <- function (x, y) {
  x + y
}
add2(7, 13)

# Now, for our function that takes a parameter x (vector) and shows which elements contained are greater than 10
above10 <- function (x) {
  use <- x > 10
  x[use] # Displays elements in vector greater than 10
}

above <- function (x, n) {
  use <- x > n
  x[use] # Displays elements in x greater than value of n supplied
}

x <- 1:20
above(x, 15)
