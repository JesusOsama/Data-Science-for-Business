library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
install.packages("factoextra")
library(factoextra) # clustering algorithms & visualization
library(funModeling)
library(Hmisc)

df <- read.csv("./Course_01/Session_09/Mall_Customers.csv")
head(df)

df <- na.omit(df)
df<-df[-c(1,2)]
head(df)

plot(df$Age,df$Score,col="red",xlab="Age",ylab = "Spending Score", main="Age VS Spending Score")

df <- scale(df)
head(df)

k2 <- kmeans(df, centers = 2, nstart = 25)
str(k2)

fviz_cluster(k2, data = df)

k6 <- kmeans(df, centers = 6, nstart = 25)
str(k6)

fviz_cluster(k6, data = df)
