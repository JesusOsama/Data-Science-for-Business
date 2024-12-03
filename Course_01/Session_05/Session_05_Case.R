library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

# Load the data into R
# Read Dataset
income.data <- read.csv("Course_01/Session_05/income.data.csv")
summary(income.data)
head(income.data)

# Make sure your data meet the assumptions
# Independency
# Normality
hist(income.data$happiness)

#Linearity
plot(happiness ~ income, data = income.data)

# Simple regression: income and happiness
income.happiness.lm <- lm(happiness ~ income, data = income.data)

summary(income.happiness.lm)

#Check for homoscedasticity
par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))


#Data Visualization

income.graph<-ggplot(income.data, aes(x=income, y=happiness))+
  geom_point()
income.graph


income.graph <- income.graph + geom_smooth(method="lm", col="black")

income.graph

income.graph <- income.graph +
  stat_regline_equation(label.x = 3, label.y = 7)

income.graph

income.graph +
  theme_bw() +
  labs(title = "Reported happiness as a function of income",
       x = "Income (x$10,000)",
       y = "Happiness score (0 to 10)")
