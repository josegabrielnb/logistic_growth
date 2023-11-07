#Script to estimate the model parameters using a linear approximation

#library(dplyr)

install.packages(dplyr)
library(dplyr)
growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small
#here we are trying to find out what r and N are
#t has to be small in order to obtain these values, so it has to be below where the previous ggplot asymptotes
#it has to be below the asymptote, as we are trying to find r, the growth rate, therefore, have to make t below where the asymptote occurs

data_subset1 <- growth_data %>% filter(t<1600) %>% mutate(N_log = log(N))

#this graph is a linear model to the very beginning of the sigmoidal graph
#where the graph is linear = that is where there is exponential growth 

model1 <- lm(N_log ~ t, data_subset1) #this is the linear model 
summary(model1) #giving you the actual values are - giving you the gradient and what the intercept is 

#Case 2. N(t) = K
#t has to therefore now be larger than where this asymptotes, which in this case is above 2400

data_subset2 <- growth_data %>% filter(t>2400)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
