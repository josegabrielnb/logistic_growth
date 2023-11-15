#Script to estimate the model parameters using a linear approximation

#library(dplyr)
install.packages("dplyr")
library(dplyr)


growth_data <- read.csv("experiment3.csv")

#Case 1. K >> N0, t is small. This will therefore show exponential growth
#Put t as less than where it starts to go non exponential

data_subset1 <- growth_data %>% filter(t<3000) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#So this is for the first part of the graph where there is exponential growth 
#The intercept is log(N0) and the gradient is r 
#Linearisation of the log of the first part of the model

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
#This is the second part of the model 