library(factoextra)
library(cluster)

#load data
df <- USArrests

#remove rows with missing values
df <- na.omit(df)

#scale each variable to have a mean of 0 and sd of 1
df <- scale(df)

#view first six rows of dataset
head(df)

fviz_nbclust(df, kmeans, method = "wss")


set.seed(1)

#perform k-means clustering with k = 4 clusters
km <- kmeans(df, centers = 4, nstart = 25)

#view results
km


fviz_cluster(km, data = df)

#find means of each cluster
aggregate(USArrests, by=list(cluster=km$cluster), mean)

#add cluster assigment to original data
final_data <- cbind(USArrests, cluster = km$cluster)

#view final data
head(final_data)

