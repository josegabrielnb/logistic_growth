#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small
###Population grows exponentially (observation.1)
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

exp(6.8941709)

#Case 2. N(t) = K
##modelling observation 2(?)
data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)