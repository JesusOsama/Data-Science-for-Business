# Load Packages
#install.packages("tidyverse")
library(tidyverse)

# Read Dataset
heart_data <- read.csv("Course_01/Session_04/heart.csv")

# Explore dataset
head(heart_data)
tail(heart_data)

# Dimensions dataset
dim(heart_data)

# Types of data
str(heart_data)

# Stadistical summary
summary(heart_data)

# Train (80%) and Test (20%)
set.seed(123) 
sample_size <- floor(0.8 * nrow(heart_data))
train_index <- sample(seq_len(nrow(heart_data)), size = sample_size)

train_data <- heart_data[train_index, ]
test_data <- heart_data[-train_index, ]

# Building a model
# Logistic Regression
model <- glm(output ~ ., data = train_data, family = binomial)

# Summary of the model
summary(model)

# Make Predictions
predictions <- predict(model, test_data, type = "response")
predictions
# Probability 
predicted_class <- ifelse(predictions >= 0.5, 1, 0)
predicted_class

# Performance of the model
confusion_matrix <- table(predicted_class, test_data$output)
print(confusion_matrix)

# Accuracy of the model
accuracy <- sum(predicted_class == test_data$output) / nrow(test_data)
print(paste("Model Accuracy:", round(accuracy, 2)))

# The most important variables
coef_df <- as.data.frame(coef(model))
ggplot(coef_df, aes(x = rownames(coef_df), y = coef_df$`coef(model)`)) + 
  geom_bar(stat = "identity") + 
  coord_flip() +
  labs(title = "Importance of variables", x = "variables", y = "Coefficients")
