# =================
# Lexical Scoping
# =================

# This example will show how R can return a function from a previoius function and variables and their values can be called from another function as long as its environment has been defined and is running

make.power <- function (n) {
  pow <- function (x) {
    x^n
  }
  return(pow)
}

# Run tests
cube <- make.power(3) # 3^3 == 27
square <- make.power(2) # 3^2 == 9
