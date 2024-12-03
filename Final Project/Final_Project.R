# CRISP Methodology
# 1. Business Understading
# 2. Data Understading
# 3. Data Preparation
# 4. Modeling
# 5. Evaluation
# 6. Deployment

# Load required libraries
library(tidyverse)
library(caret)
library(randomForest)
library(corrplot)
library(ROCR)
library(e1071)
library(dplyr)

# Read the data
credit_data <- read.csv("Final Project/credit_risk_dataset.csv")

# 2. Data Understanding
# Convert categorical variables to factors
credit_data$loan_status <- as.factor(credit_data$loan_status)
credit_data$person_home_ownership <- as.factor(credit_data$person_home_ownership)
credit_data$loan_intent <- as.factor(credit_data$loan_intent)
credit_data$loan_grade <- as.factor(credit_data$loan_grade)
credit_data$cb_person_default_on_file <- as.factor(credit_data$cb_person_default_on_file)

# Check missing values
missing_values <- colSums(is.na(credit_data))
print(missing_values)

# Remove rows with missing values
credit_data_clean <- na.omit(credit_data)

# Basic statistics
summary(credit_data_clean)

# 2. Exploratory Data Analysis

# Correlation matrix for numeric variables
numeric_vars <- credit_data_clean %>% 
  select_if(is.numeric)
correlation_matrix <- cor(numeric_vars)

# Plot correlation matrix
corrplot(correlation_matrix, method = "color", 
         title = "Correlation Matrix of Numeric Variables",
         tl.cex = 0.7)

# Distribution of loan status with ggplot2
ggplot(credit_data_clean, aes(x = loan_status)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribution of Loan Status",
       x = "Loan Status",
       y = "Count") +
  theme_minimal()

# Distribution of loan grades by status
ggplot(credit_data_clean, aes(x = loan_grade, fill = loan_status)) +
  geom_bar(position = "dodge") +
  labs(title = "Loan Grade Distribution by Status",
       x = "Loan Grade",
       y = "Count") +
  theme_minimal()

# Box plot of loan amount by status
ggplot(credit_data_clean, aes(x = loan_status, y = loan_amnt, fill = loan_status)) +
  geom_boxplot() +
  labs(title = "Loan Amount Distribution by Status",
       x = "Loan Status",
       y = "Loan Amount") +
  theme_minimal()

# Density plot of interest rate by status
ggplot(credit_data_clean, aes(x = loan_int_rate, fill = loan_status)) +
  geom_density(alpha = 0.5) +
  labs(title = "Interest Rate Distribution by Loan Status",
       x = "Interest Rate",
       y = "Density") +
  theme_minimal()

# Histogram plot of Person Income
ggplot( _ , aes(x = _ )) +
  geom_histogram(binwidth = _, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "_",
       x = "_",
       y = "_") +
  theme_minimal()

# Loan Amount by Purpose
# Summarize the data
avg_loan_by_purpose <- credit_data_clean %>%
  group_by(loan_intent) %>%
  summarize(avg_loan = mean(loan_amnt, na.rm = TRUE))

# Bar Plot
ggplot( _ , aes(x = _ , y = _)) +
  geom_bar(stat = "identity", fill = "green", color = "black") +
  labs(title = "_"
       , x = "_"
       , y = "_") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Loan Grade
ggplot( _ , aes(x = _)) +
  geom_bar(fill = "steelblue", color = "black") +
  labs(title = "_", x = "_", y = "_")

# Loan amount by home ownership
# Boxplot  
ggplot( _ , aes(x = _ , y = _ )) +
  geom_boxplot(fill = "cyan", color = "black") +
  labs(title = "_", x = "_", y = "_") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Loan percent income by Loan intent
# Boxplot 
ggplot( _ , aes(x = _ , y = _ )) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = " _ ", x = " _ ", y = " _ ") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 3. Data Preparation
# Create age groups
credit_data_clean$age_group <- cut(credit_data_clean$person_age, 
                                   breaks = c(0, 25, 35, 45, Inf),
                                   labels = c("18-25", "26-35", "36-45", "45+"))


# 4. Modeling
# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(credit_data_clean$loan_status, p = 0.7, list = FALSE)
train_data <- credit_data_clean[train_index, ]
test_data <- credit_data_clean[-train_index, ]

# Define predictor variables
predictors <- c("age_group", "person_income", "person_home_ownership", 
                "person_emp_length", "loan_intent", "loan_grade",
                "loan_amnt", "loan_int_rate",
                "loan_percent_income", "cb_person_default_on_file"
                , "cb_person_cred_hist_length")

# Model Training
# Random Forest Model
rf_model <- randomForest(formula = as.formula(paste("loan_status ~", 
                                                    paste(predictors, collapse = " + "))),
                         data = train_data,
                         ntree = 500,
                         importance = TRUE)


# 5. Model Evaluation
# Make predictions on test set
rf_predictions <- predict(rf_model, test_data)

# Create confusion matrix
conf_matrix <- confusionMatrix(rf_predictions, test_data$loan_status)
print(conf_matrix)

# Create summary statistics for the report
model_summary <- list(
  accuracy = conf_matrix$overall["Accuracy"],
  sensitivity = conf_matrix$byClass["Sensitivity"],
  specificity = conf_matrix$byClass["Specificity"],
  precision = conf_matrix$byClass["Pos Pred Value"],
  f1_score = conf_matrix$byClass["F1"]
)

# Print model performance summary
print(model_summary)
