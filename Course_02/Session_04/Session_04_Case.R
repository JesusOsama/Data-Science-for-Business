# Load the mtcars dataset
data(mtcars)

# Calculate summary statistics for mpg
mean_mpg <- mean(mtcars$mpg)  # Mean: average fuel efficiency
median_mpg <- median(mtcars$mpg)  # Median: middle value of mpg
sd_mpg <- sd(mtcars$mpg)  # Standard Deviation: measure of variation in mpg
min_mpg <- min(mtcars$mpg)  # Minimum value of mpg
max_mpg <- max(mtcars$mpg)  # Maximum value of mpg
range_mpg <- range(mtcars$mpg)  # Range of mpg values

summary(mtcars)


# Display summary statistics
cat("Mean MPG:", mean_mpg, "\n")
cat("Median MPG:", median_mpg, "\n")
cat("Standard Deviation of MPG:", sd_mpg, "\n")
cat("Minimum MPG:", min_mpg, "\n")
cat("Maximum MPG:", max_mpg, "\n")
cat("Range of MPG:", range_mpg, "\n")

# Create a histogram to visualize the distribution of mpg
hist(mtcars$mpg, 
     main="MPG Distribution", 
     xlab="Miles Per Gallon (MPG)", 
     col="lightblue", 
     border="black")

# Add a density line to the histogram for better understanding of data distribution
lines(density(mtcars$mpg), col="red", lwd=2)

# Boxplot to visualize mpg distribution and detect outliers
boxplot(mtcars$mpg, 
        main="Boxplot of MPG", 
        ylab="Miles Per Gallon (MPG)", 
        col="orange")

# Scatter plot of MPG vs Horsepower to explore relationships
plot(mtcars$hp, mtcars$mpg, 
     main="MPG vs Horsepower", 
     xlab="Horsepower", 
     ylab="Miles Per Gallon (MPG)", 
     pch=19, col="darkgreen")

# Add a regression line to see the trend
abline(lm(mpg ~ hp, data=mtcars), col="blue", lwd=2)

# Correlation between MPG and Horsepower
correlation_mpg_hp <- cor(mtcars$mpg, mtcars$hp)
cat("Correlation between MPG and Horsepower:", correlation_mpg_hp, "\n")

# Additional insights: Summary of the mtcars dataset
summary_stats <- summary(mtcars)
cat("Summary of mtcars dataset:\n")
print(summary_stats)