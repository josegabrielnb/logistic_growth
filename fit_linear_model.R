#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1600) %>% mutate(N_log = log(N))
#I have chosen 1600 as a value for which only data below this will be included to ensure that it only includes the straight line (linear)
#Using a very small value such as 200 would not include sufficient data points to provide accurate estimates. 

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>2200)

#This value here is to apply a linear model to the constant/horizontal section of the graph.

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
