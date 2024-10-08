## Importing packages

library(tidyverse)
library(tree)
#### Activity 1 ####

## Load data
student_data <- read.csv("./Course_01/Session_07/StudentData.csv")

## Explore Data
summary(student_data)
names(student_data)
head(student_data)

## Preprocess
any(is.na(student_data))
student_data$Designation <- as.factor(student_data$Designation)

## Plots
ggplot(data = student_data) +
  geom_point(mapping = aes(x=Study_Time, y= GPA, color = Designation))

## Decision Tree
tree.student_data = tree(Designation~., data = student_data)
summary(tree.student_data)

plot(tree.student_data)
text(tree.student_data, pretty = 0)

tree.student_data

#### Activity 2 ####

## Load the Pokemon Dataset
Pokemon <- read.csv("./Course_01/Session_07/PokemonData.csv")

## Explore Data
Pokemon$Legendary <- factor(Pokemon$Legendary, levels = c(TRUE, FALSE), labels = c("Legendary","Not_Legendary"))
names(Pokemon)
head(Pokemon)

## Decision Tree
tree.Pokemon = tree(Legendary~HP+Attack+Defense+SpAtk+SpDef+Speed+Generation, data=Pokemon)
summary(tree.Pokemon)

plot(tree.Pokemon)
text(tree.Pokemon, pretty=0)
