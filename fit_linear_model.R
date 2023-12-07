#Script to estimate the model parameters using a linear approximation

#install and load package dplyr needed for filtering, selecting and mutating data
install.packages("dplyr")
library(dplyr)

#create a data frame by reading in the data from the experiment 1 csv file
growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small
#the exponential growth phase where carrying capacity is greater than population size
#there are sufficient resources for growth so rapid growth in relatively short time period

data_subset1 <- growth_data %>% filter(t<2000) %>% mutate(N_log = log(N))
#filter(t<2000) includes data only from time less than 2000 (the exponential growth phase)
#mutate(N_log = log(N)) creates a natural logarithm for population size N which linearises the exponential growth

model1 <- lm(N_log ~ t, data_subset1)
#fits a linear model predicting logarithm of N from time which in early logistic growth phase is approximately linear

summary(model1)
#provides estimates of the intercept (log-transformed initial population size) and slope (intrinsic growth rate)
#slope is 0.0095218 and intercept is 7.1855445

#Case 2. N(t) = K
#the plateau phase where population size reaches carrying capacity

data_subset2 <- growth_data %>% filter(t>2000)
#filter(t>2000) includes data only from time greater than 2000

model2 <- lm(N ~ 1, data_subset2)
#fits a linear model which provides an estimate for the carrying capacity as it assumes N has plateaued at K

summary(model2)
#provides the intercept of the data which is an estimate of the carrying capacity
#intercept is 5.7979e+10
