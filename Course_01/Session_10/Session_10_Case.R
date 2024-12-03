library(tidyverse)
library(Hmisc)
library(caret)
library(ROSE)
library(ggplot2)
#library(gridExtra)
library(e1071)
library(corrplot)
library(broom)
library(party)

data <- read.csv('./Course_01/Session_10/creditcard/creditcard.csv', stringsAsFactors = T)

str(data)


# Convert Class column into Factors
data$Class <- as.factor(data$Class)
levels(data$Class) <- c("Legit", "Fraud")

# function to set plot height and width
fig <- function(width, heigth){
  options(repr.plot.width = width, repr.plot.height = heigth)
}

summary(data)



fig(10, 6)

ggplot(data, aes(x=Class, fill = Class)) + geom_bar(color = "black") + 
  ggtitle("Bar Distribution of Class") + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))



counts <- table(data$Class)
result <- data.frame(table(data$Class), round(prop.table(counts), 5))
noms <- c("Class", "Value", "none", "Proportion")

names(result) <- noms

print(result[c(1,2,4)])


# Check for missing values
colSums(is.na(data))
sum(is.na(data))

# Check for duplicate rows
sum(duplicated(data))

# Remove any duplicate rows
data <- distinct(data)

data$Time <- NULL


# Standardise Amount feature
data$Amount <- scale(data$Amount)
summary(data$Amount)


set.seed(123)

indices <- createDataPartition(data$Class, p=0.8, list = F)
trainData <- data[indices,]
testData <- data[-indices,]
  

NBmodCCF <- naiveBayes(Class ~ ., data = trainData, laplace = 1)
model_nb_prediction <- predict(NBmodCCF, newdata = testData, type = "class")

roc.curve(testData$Class, model_nb_prediction, plotit = TRUE)



