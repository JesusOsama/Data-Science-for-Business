
#### R Functions ####

# 1. Functions in R
# R has many built-in functions

# Mathematical function
print(sqrt(25))

# Statistical function
print(mean(c(1, 2, 3, 4, 5)))


# 2. Create Functions
hello <- function(name) {
  paste("Hello,", name, "!")
}

print(hello("Sofia"))

# 3. Functions with multiple parameters
ibm <- function(weight, height) {
  ibm <- weight / (height^2)
  return(ibm)
}

print(ibm(70, 1.75))

# 6. Functions with Conditionals
grade <- function(score) {
  if (score >= 90) {
    return("A")
  } else if (score >= 80) {
    return("B")
  } else if (score >= 70) {
    return("C")
  } else {
    return("D")
  }
}

print(grade(85))
#### Data Visualization ####

# First, install and load ggplot2 if you haven't already
# install.packages("ggplot2")
library(ggplot2)

# Use the built-in 'mpg' data set for these examples
data(mpg)

# 1. Basic scatter plot
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

# 2. Add color to points based on a variable
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

# 3. Line plot with smoothing
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "lm")

# 4. Histogram
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2)

# 5. Bar plot
ggplot(mpg, aes(x = class)) +
  geom_bar()

# 6. Box plot
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

# 7. Violin plot
ggplot(mpg, aes(x = class, y = hwy)) +
  geom_violin()

# 8. Facets (multiple plots)
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~ class)

# 9. Theme customization
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Relationship between Engine Size and Fuel Efficiency",
       x = "Engine Size (L)",
       y = "Highway Fuel Efficiency (mpg)")

# 10. Density plot
ggplot(mpg, aes(x = hwy, fill = class)) +
  geom_density(alpha = 0.5)

# 11. Stacked bar plot
ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar()

# 12. Heat map (requires reshape2)
# install.packages("reshape2")
library(reshape2)
mpg_mean <- aggregate(mpg[, c("cty", "hwy")], list(mpg$class), mean)
mpg_mean_melted <- melt(mpg_mean, id.vars = "Group.1")

ggplot(mpg_mean_melted, aes(x = Group.1, y = variable, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(x = "Class", y = "Efficiency Type", fill = "Average MPG")