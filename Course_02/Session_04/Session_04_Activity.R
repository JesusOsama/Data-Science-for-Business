# Load the mtcars dataset
data(mtcars)

# Calculate summary statistics for mpg
mean_mpg <- mean(mtcars$mpg)
median_mpg <- median(mtcars$mpg)
sd_mpg <- sd(mtcars$mpg)

# Create a histogram of mpg
hist(mtcars$mpg, main="MPG Distribution", xlab="MPG")

# Print the calculated statistics
print(paste("Mean MPG:", mean_mpg))
print(paste("Median MPG:", median_mpg))
print(paste("Standard Deviation of MPG:", sd_mpg))
