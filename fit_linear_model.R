#Script to estimate the model parameters using a linear approximation
#This part of the practical splits up the log graph into 2 different linear models. One for exponential growth, and one for zero growth
#library(dplyr)
install.packages("dplyr")
library(dplyr)
growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))
#This is significant showing that for these times "t" the model is exponential (it is significantly linear)
model1 <- lm(N_log ~ t, data_subset1) 
summary(model1) #This model will give the gradient of the diagonal line which represents exponential growth in the output which is the estimate value for t. The estimate intercept value of 6.8941707 represents the log value of NO (which is the starting population size)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>4000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2) #The intercept estimate value in this model summary is where this straight line would intercept the y axis this represents the carrying capacity K 
#This is a separation into two different models. Both are linear, whilst one is exponentially increasing, the other is a flatline