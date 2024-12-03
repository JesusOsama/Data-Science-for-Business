library(tidyverse)


breastCancer <- read.csv("Course_01/Session_06/Breast_cancer_data.csv")

set.seed(1234)
breastCancer <- breastCancer[sample(nrow(breastCancer)), ]

head(breastCancer)

str(breastCancer)

any(is.na(breastCancer))

cor(breastCancer)
plot(breastCancer)


#randomising breastCancer
set.seed(1234)
breastCancer <- breastCancer[sample(nrow(breastCancer)), ]
train <- breastCancer[1:285, ]
test <- breastCancer[286:569, ]


#Logistic Regression Model
glm.fits <- glm(data = train, diagnosis ~ mean_radius + mean_texture + mean_smoothness,
                family = binomial)
summary(glm.fits)

#Getting the probabilty of breast cancer
glm.probs = predict(glm.fits, test, type = "response")
#Creating factor levels
test$diagnosis <- as.factor(test$diagnosis)
train$diagnosis <- as.factor(train$diagnosis)

contrasts(train$diagnosis)

glm.pred = rep(0, 284)
glm.pred[glm.probs > .5] <- 1

table(glm.pred, test$diagnosis)
mean(glm.pred == test$diagnosis)
