library(mt)
library(caret)
library(httr)
library(readxl)
library(dplyr)

GET("https://query.data.world/s/qmc5py3qjodoyglqcny7ihdowxwepf?dws=00000", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- data.frame(read_excel(tf))

head(df)

prop.table(table(df$Diabetes))

df_reduced <- df[c("Diabetes", "Cholesterol", "Glucose", "BMI", "Waist.hip.ratio", "HDL.Chol", "Chol.HDL.ratio", "Systolic.BP", "Diastolic.BP", "Weight")]

preproc_reduced <- preProcess(df_reduced[,2:10], method = c("scale", "center"))

df_standardized <- predict(preproc_reduced, df_reduced[, 2:10])

summary(df_standardized)

df_stdize <- bind_cols(Diabetes = df_reduced$Diabetes, df_standardized)


set.seed(42)
# p indicates how much of the data should go into the first created partition
param_split<- createDataPartition(df_stdize$Diabetes, times = 1, p = 0.8, list = FALSE)
train_df <- df_stdize[param_split, ]
test_df <- df_stdize[-param_split, ]


trnctrl_df <- trainControl(method = "cv", number = 10)
model_knn_df <- train(Diabetes ~ ., data = train_df, method = "knn", 
                      trControl = trnctrl_df, 
                      tuneLength = 10)

model_knn_df
