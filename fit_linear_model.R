#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small
#Trying to find the values for N, r; t must therefore be below asymptote to find r

data_subset1 <- growth_data %>% filter(t<1600) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K
#To find N, t must be above asymptote

data_subset2 <- growth_data %>% filter(t>2400)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
