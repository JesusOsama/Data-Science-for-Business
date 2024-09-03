# Load Packages
# install.packages("tidyverse")
library(tidyverse)

# Iris Dataset

data(iris)  # Load Data
head(iris)  # Show first rows of dataset

# Supervised Method

# install.packages("rpart")
library(rpart)

# Model = Recursive Partitioning and Regression Trees
supervised_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris, method = "class")

# Show the model
print(supervised_model)

# Prediction
predicciones <- predict(supervised_model, iris, type = "class")
head(predicciones)  # Show the first predictions

# NonSupervised Method

# install.packages("cluster")
library(cluster)

# Kmeans
set.seed(123)  # Seed
clustering <- kmeans(iris[, 1:4], centers = 3)  # 3 Clusters

#Results of a Cluster
table(clustering$cluster)  # Number of points in every cluster

# Add a column 
iris$Cluster <- as.factor(clustering$cluster)

# Plot the clusters
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Cluster)) +
  geom_point() +
  labs(title = "Clustering pf flowers using K-means",
       x = "Petal Length",
       y = "Petal Width")
