#### Data Structures ####
# 1. Vectors
# Vectors are a uni dimensional collection of elements which are of the same type

# Numeric Vector
numbers <- c(1, 2, 15, 4, 5, 6, 10, 10000, 99)
print(numbers)

# Character Vector
fruits <- c("apple", "banana", "grapes", "pineapple")
print(fruits)

# Logic Vector
logic <- c(TRUE, FALSE, TRUE, TRUE)
print(logic)

# How to access to specific elements
print(numbers[7])  # Third elements
print(fruits[2:4])  # Two First elements


# 2. Matrix
# Bi dimensional Collections of elements
# Create a Matrix
matrix_example <- matrix(1:9, nrow = 3, ncol = 3)
print(matrix_example)

# Access to elements 
print(matrix_example[2, 2])  # Row 2, column 3

# 3. List 
# Lists can contain elements of different types

my_list <- list(
  name = "Mark",
  age = 25,
  scores = c(85, 90, 88),
  passed = TRUE
)
print(my_list)

# Access to element of a list
print(my_list$scores) # the most common
print(my_list[["scores"]])

print(my_list[[1]])
print(my_list[["name"]])

# 5. Data Frames
# Data frames are tables used to make Data Science analysis

df <- data.frame(
  name = c("Ana", "Carlos", "María", "Pedro", "Jesus"),
  age = c(22, 28, 25, 30, 22),
  city = c("Madrid", "Barcelona", "Sevilla", "Valencia", "Pasco")
)
print(df)

# Access to columns
print(df$city)
print(df[["city"]])

# Access to Rows
print(df[2, ])  # Second Row
print(df[1:3, ])  # First three rows

# Filter a data frame
older_25 <- df[df$age > 25, ]
print(older_25)

df_madrid <- df[df$city == "Madrid", ]
print(df_madrid)

#### R Packages ####

# 1. Installation of packages
# Use install.packages() 
install.packages("dplyr")
install.packages(c("tidyr", "readr", "lubridate"))

install.packages("ggplot2")

# 2. Load packages
# Use library() to load a package
library(dplyr)
library(ggplot2)

# 3. To see installed packages
installed.packages()

# 4. To see loaded packages
search()

# 5. Documentation of a Package
help(package = "ggplot2")

# 6. Version of a package
packageVersion("dplyr")

#### R Functions ####

# 1. Functions in R
# R has many built-in functions

# Mathematical function
print(sqrt(30))

# Statistical function
print(mean(c(1, 2, 3, 4, 5, 60)))


# 2. Create Functions
hello <- function(name) {
  paste("Hello,", name, "!")
}

print(hello("Atharv"))

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

print(grade(60))
