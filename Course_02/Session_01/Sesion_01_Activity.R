#### Introduction to R ####
# 1. Comments 
# This is a line of code 
# Comments are so useful to explain code

# 2. Print
print("Hello, world!")
cat("Other way to print")

# 3. Basic Mathematics Operations
5 + 3   # Addition
10 - 4  # Subtraction
6 * 2   # Multiplication
15 / 3  # Division
2^3     # Power
16 %% 3 # Module (rest of division)

# 4. Variables
x <- 10        # Arrow
y = 5          # Equal sign
name <- "Ana"
is_student <- TRUE

# 5. Types of variables
integer <- 42         # Integer
float <- 3.14         # Numeric (double)
text <- "Hola, R"     # Character
logical <- FALSE       # Logical (Boolean)

# 6. Logical Operations
x <- 5
y <- 10
greater <- (x > y)
less <- x < y
equal <- x == y
different <- x != y

print(greater)

# 7. Conditional if-else
age <- 12
if (age >= 18) {
  print("You are of legal age 😎")
} else {
  print("You are not of legal age ❌")
}

# Loop for
for (i in 1:5) {
  print(i)
}

for (i in 1:10) {
  print(paste("Number:", i))
}

#### Importing Data ####

# Import a CSV file
dataset <- read.csv("Session_01/medals_total.csv")

head(dataset)

# Summary of Data
summary(dataset)


