#Script to estimate the model parameters using a linear approximation

install.packages("dplyr") #loading a package to manipulate the data 
library(dplyr)

growth_data <- read.csv("experiment2.csv") #loading data

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<541) %>% mutate(N_log = log(N)) #filtering data to only include values when t<541 and adding a column with log(N)

model1 <- lm(N_log ~ t, data_subset1) #creating a linear model from the filtered data 
summary(model1) #looking at the output of that model

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>541) #filtering the data to only include values where t>541

model2 <- lm(N ~ 1, data_subset2) #creating a linear model from the filtered data 
summary(model2) #looking at the output of that model

