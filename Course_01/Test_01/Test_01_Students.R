# Load necessary libraries
library(tidyverse)
library(ggplot2)
library(caret)

# 1. Load the dataset
# TODO: Load the 'bank.csv' dataset using read.csv and assign it to 'bank_data'
# Hint: The file uses ';' as separator

# bank_data <- ...

# 2. Data Exploration
# View structure and summary
str(bank_data)
summary(bank_data)

# Frequency of the target variable
table(bank_data$y)

# 3. Data Cleaning
# Check for missing values
sum(is.na(bank_data))

# Convert character columns to factors
bank_data <- bank_data %>%
  mutate_if(is.character, as.factor)

# 4. Data Visualization

# DONE: Plot target variable
ggplot(bank_data, aes(x = y)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Target Variable Distribution", x = "Subscription", y = "Count")

# TODO: Plot a histogram of 'age' by subscription status
# Hint: Use fill = y, binwidth = 5, position = "dodge"

# ggplot(...) + ...

# 5. Train/Test Split
set.seed(123)
train_index <- createDataPartition(bank_data$y, p = 0.7, list = FALSE)
train_data <- bank_data[train_index, ]
test_data <- bank_data[-train_index, ]

# 6. Model Training
# TODO: Train a logistic regression model on train_data
# model <- ...

# 7. Prediction
# TODO: Use the model to predict probabilities on test_data
# pred_probs <- ...

# TODO: Convert probabilities to class labels
# predictions <- ifelse(...)

# Convert to factor
# predictions <- factor(predictions, levels = c("no", "yes"))

# 8. Evaluation
# TODO: Use confusionMatrix to evaluate predictions
# confusionMatrix(...)

# TODO: Calculate and print accuracy
# accuracy <- ...
# print(paste("Accuracy:", round(accuracy, 2)))
