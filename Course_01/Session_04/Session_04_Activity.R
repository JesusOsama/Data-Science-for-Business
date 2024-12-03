#### Supervised and Unsupervised Methods ####
# Load Packages
# install.packages("tidyverse")
library(tidyverse)

# Iris Dataset

data(iris)  # Load Data
head(iris)  # Show first rows of dataset
tail(iris)

#### Data Exploration ####
library(ggplot2)

# Bar Plot
ggplot(iris, aes(x = Species)) +
  geom_bar(fill = "lightblue", color = "black") +
  labs(title = "Distribution of species", x = "Species", y = "Quantity")

# Scatter Plot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  labs(title = "Relationship between petal length and width", x = "Petal Length", y = "Petal Width")

#### Building Models ####

# Supervised Method

#install.packages("rpart")
library(rpart)

# Model = Recursive Partitioning and Regression Trees
supervised_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris, method = "class")

# Show the model
print(supervised_model)

# Prediction
prediccions <- predict(supervised_model, iris, type = "class")
head(prediccions)  # Show the first predictions
tail(prediccions)

# NonSupervised Method

install.packages("cluster")
library(cluster)

# Kmeans
set.seed(123)  # Seed
clustering <- kmeans(iris[, 1:4], centers = 3)  # 3 Clusters

#Results of a Cluster
table(clustering$cluster)  # Number of points in every cluster

# Add a column 
iris$Cluster <- as.factor(clustering$cluster)
head(iris)

# Plot the clusters
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Cluster)) +
  geom_point() +
  labs(title = "Clustering pf flowers using K-means",
       x = "Petal Length",
       y = "Petal Width")
