#### Data Structures ####
# 1. Vectors
# Vectors are a uni dimensional collection of elements which are of the same type

# Numeric Vector
numbers <- c(1, 2, 3, 4, 5)
print(numbers)

# Character Vector
fruits <- c("apple", "banana", "grapes")
print(fruits)

# Logic Vector
logico <- c(TRUE, FALSE, TRUE, TRUE)
print(logico)

# How to access to specific elements
print(numeros[3])  # Third elements
print(frutas[1:2])  # Two First elements


# 2. Matrix
# Bi dimensional Collections of elements

# Create a Matrix
matrix <- matrix(1:9, nrow = 3, ncol = 3)
print(matrix)

# Access to elements 
print(matriz[2, 3])  # Row 2, column 3

# 3. List 
# Lists can contain elements of different types

my_list <- list(
  name = "Mark",
  age = 25,
  scores = c(85, 90, 88),
  passed = TRUE
)
print(my_list)

# Access to elemento of a list
print(my_list$name)
print(my_list[[2]])
print(my_list[["scores"]])

# 5. Data Frames
# Data frames are tables used to make Data Science analysis

df <- data.frame(
  name = c("Ana", "Carlos", "María", "Pedro"),
  age = c(22, 28, 25, 30),
  city = c("Madrid", "Barcelona", "Sevilla", "Valencia")
)
print(df)

# Access to columns
print(df$nombre)
print(df[["edad"]])

# Access to Rows
print(df[2, ])  # Second Row
print(df[1:3, ])  # First three rows

# Filter a data frame
older_25 <- df[df$age > 25, ]
print(older_25)

#### R Packages ####

# 1. Installation of packages
# Use install.packages() 
install.packages("dplyr")
install.packages("ggplot2")
install.packages(c("tidyr", "readr", "lubridate"))

# 2. Load packages
# Use library() to load a package
library(dplyr)
library(ggplot2)

# 3. To see installed packages
installed.packages()

# 4. To see loaded packages
search()

# 5. Documentation of a Package
help(package = "dplyr")

# 6. Version of a package
packageVersion("dplyr")
