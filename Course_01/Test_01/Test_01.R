# Load necessary libraries
library(tidyverse)
library(caret)
library(ggplot2)

# 1. Load the dataset
bank_data <- read.csv("Course_01/Test_01/bank.csv", sep = ";")

# 2. Data Exploration
# View the structure of the dataset
str(bank_data)

# Summary statistics
summary(bank_data)

# Check the distribution of the target variable
table(bank_data$y)

# 3. Data Cleaning
# Check for missing values
sum(is.na(bank_data))

# Convert character columns to factors
bank_data <- bank_data %>%
  mutate_if(is.character, as.factor)

# 4. Data Visualization
# Plot the distribution of the target variable
ggplot(bank_data, aes(x = y)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribution of Target Variable", x = "Subscribed to Term Deposit", y = "Count")

# Plot age distribution by subscription status
ggplot(bank_data, aes(x = age, fill = y)) +
  geom_histogram(binwidth = 5, position = "dodge") +
  labs(title = "Age Distribution by Subscription Status", x = "Age", y = "Count")

# 5. Data Preparation for Modeling
set.seed(123)
train_index <- createDataPartition(bank_data$y, p = 0.7, list = FALSE)
train_data <- bank_data[train_index, ]
test_data <- bank_data[-train_index, ]

# 6. Model Training (Logistic Regression)
model <- glm(y ~ ., data = train_data, family = binomial)

# 7. Model Evaluation
# Predict probabilities on the test set
pred_probs <- predict(model, newdata = test_data, type = "response")

# Convert probabilities to class labels
predictions <- ifelse(pred_probs > 0.5, "yes", "no")
predictions <- factor(predictions, levels = c("no", "yes"))

# Confusion matrix
confusionMatrix(predictions, test_data$y)

# Calculate accuracy
accuracy <- mean(predictions == test_data$y)
print(paste("Model Accuracy:", round(accuracy, 2)))
