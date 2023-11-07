#Script to estimate the model parameters using a linear approximation

#library(dplyr)
install.packages("dplyr")
library(dplyr)
growth_data <- read.csv( "/cloud/project/experiment1.csv")
file.choose()
#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))

#When t is small you refer to the exponential part: want to get the intercept: which is 6.83e+00 and the gradient is 1.004e05  
#this model finds the intercept and the gradient, which is r 
model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#this is how we find k: the carrying capacity is 6e+10: 60 Billion 

