# ============================
# R Date and Time Exercise
# ============================

x <- Sys.time()
print(x)

# Assign p as value of x in POSIXlt (list) standard
p <- as.POSIXlt(x)
names(unclass(p))
typeof(p)
p$sec

# Times in R

# Assign current system date and time to variable x
x <- Sys.time() # x still in POSIXlt format

unclass(x)
x$sec # Will give error because it's a big int and not list
p <- as.POSIXlt(x) # Now make it list
p$sec

# ---------

# strptime can convert string representations of dates / time into time or date formats

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
print(x)
class(x) # Show class type of both returned converted formats

# NOTE: Can't do operatiosn on objects of different format

# Show date difference between two date values of same format
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x - y
class(x)
class(y)

# Same using standards format
x <- as.POSIXlt("2012-10-25 01:00:00")
y <- as.POSIXlt("2012-10-25 06:00:00", tz = "GMT")
y - x
