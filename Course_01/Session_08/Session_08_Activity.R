library(tidyverse) # visualization/processing
library(lattice)# visualization
library(ggpubr) # for multiple plots
library(caret)  # machine learning models


dataset <- read.csv("./Course_01/Session_08/Iris.csv")

# Explore Dataset
head(dataset,3)
tail(dataset,3)
dim(dataset)
str(dataset)
summary(dataset)

# Preprocessing
sum(is.na(dataset))

data<- dataset[,-1]
head(data)#check if Id removed or not

data$Species <- sapply(strsplit(as.character(data$Species),'-'), "[", 2)
str(data) #check the data again and found Species became character
head(data)

data$Species <- as.factor(data$Species) #change Species as factor
str(data)

ggplot(data, aes(x =SepalWidthCm , y = SepalLengthCm  , color = Species))+
  geom_point()+               
  geom_smooth(method="loess", aes(fill= Species, color = Species))+
  facet_wrap(~Species, ncol = 3, nrow = 1)

ggplot(data, aes(x = PetalWidthCm , y =PetalLengthCm  , color = Species))+
  geom_point()+               
  geom_smooth(method="lm", aes(fill= Species, color = Species))+
  facet_wrap(~Species, ncol = 3, nrow = 1)

# Training

set.seed(2024)
# We use the dataset to create a partition (80% training 20% testing)
id <- createDataPartition(data$Species, p=0.80, list=FALSE)

# select 80% of data to train the models
train <- data[id,]
dim(train)

test <- data[-id,]
dim(test)

knn_model <- train(train[, 1:4], train[, 5], method='knn', 
                   preProcess=c("center", "scale"))

# Predict values
predictions<-predict(knn_model,test[,1:4], type="raw")

# Confusion matrix
confusionMatrix(predictions,test[,5])
