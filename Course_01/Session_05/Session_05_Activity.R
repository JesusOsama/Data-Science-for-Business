# Load Packages
# install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

# Load Iris dataset
data(iris)

#### PreProcesing and Exploration of Data ####
# Filter in just two classes (Setosa and Versicolor)
iris_filtered <- iris %>%
  filter(Species != "virginica")

# Convert the species variable to a binary value (0 o 1)
iris_filtered$Species <- ifelse(iris_filtered$Species == "setosa", 0, 1)


#### Clasification Model ####

# Fitting a logistic regression model
# We want to predict whether a flower is setose (0) 
# or versicolor (1) using petal length and petal width
logistic_model <- glm(Species ~ Petal.Length + Petal.Width, data = iris_filtered
                      , family = binomial)

# Results of the model
summary(logistic_model)

# Predictions with the model
logistical_predictions <- predict(logistic_model, type = "response")

# Convert probabilities into labels (0 or 1) using a threshold of 0.5
predictions_classification <- ifelse(logistical_predictions > 0.5, 1, 0)

# See the first predictions
head(predictions_classification)

# Clasification Plot
ggplot(iris_filtered, aes(x = Petal.Length, y = Petal.Width, 
                          color = factor(Species))) +
  geom_point(size = 3) +
  labs(title = "Flower classification using logistic regression", 
       x = "Petal length", 
       y = "Petal width") +
  scale_color_manual(values = c("blue", "red"), 
                     name = "Specie", 
                     labels = c("Setosa", "Versicolor"))


#### Regression Model ####
# Linear Regression
# We want to predict Petal.Length using Sepal.Length
regression_model <- lm(Petal.Length ~ Sepal.Length, data = iris)

# See the results of the model
summary(regression_model)

# Making predictions with the regression model
regression_predictions <- predict(regression_model)

# Regression Plot
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(color = "blue", size = 3) +  # Puntos originales
  geom_line(aes(y = regression_predictions), color = "red", size = 1) +
  labs(title = "Linear regression: Prediction of petal length", 
       x = "Sepal length", 
       y = "Petal length")
