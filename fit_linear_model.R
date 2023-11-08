#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment2.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<300) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#Gradient is 0.0301927
#Y intercept is 7.5651870
#e^7.56 = starting population
#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
#No gradient
#intercept is 1x10^9