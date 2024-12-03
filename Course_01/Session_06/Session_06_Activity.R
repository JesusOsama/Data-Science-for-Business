# Load Packages
# install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

# Load the mtcars dataset
data(mtcars)

summary(mtcars)

# Create a new binary column: 1 if mpg is greater than 20, 0 otherwise
mtcars$high_mpg <- ifelse(mtcars$mpg > 20, 1, 0)

# View the first records of the modified dataset
head(mtcars)

#### Parametric Estimation (Logistic Regression) ####
# Fit the logistic regression model
logistic_model_mtcars <- glm(high_mpg ~ wt + hp, data = mtcars, family = binomial)

# Summary of the model
summary(logistic_model_mtcars)

# Predict probabilities
logistic_probabilities_mtcars <- predict(logistic_model_mtcars, type = "response")

# View the first predicted probabilities
head(logistic_probabilities_mtcars)

# Convert probabilities into class predictions (0 or 1) using a threshold of 0.5
logistic_class_predictions <- ifelse(logistic_probabilities_mtcars >= 0.5, 1, 0)

# Compare predictions with actual classes
table(Predictions = logistic_class_predictions, Actual = mtcars$high_mpg)

#### Non-Parametric Estimation (K-Nearest Neighbors) ####
# Load the class library for K-NN
# install.packages("class") # Uncomment this line if you don't have the class library installed
library(class)

# Define the predictor variables and the target variable
X_train_mtcars <- mtcars[, c("wt", "hp")]
y_train_mtcars <- mtcars$high_mpg

# Perform classification using K-NN with k=3
knn_predictions_mtcars <- knn(train = X_train_mtcars, test = X_train_mtcars, cl = y_train_mtcars, k = 3)

# View the first K-NN predictions
head(knn_predictions_mtcars)

# Compare K-NN predictions with actual classes
table(Predictions = knn_predictions_mtcars, Actual = mtcars$high_mpg)


# Plot probabilities of having high fuel consumption based on weight and horsepower
ggplot(mtcars, aes(x = wt, y = hp, color = logistic_probabilities_mtcars)) +
  geom_point(size = 3) +
  scale_color_gradient(low = "blue", high = "red") +
  labs(title = "Probability of High Fuel Consumption (mpg > 20)", 
       x = "Car Weight (wt)", 
       y = "Horsepower (hp)")

