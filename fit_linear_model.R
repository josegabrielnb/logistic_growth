#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small
#N-zero = 1
#looking at exponential growth

data_subset1 <- growth_data %>% filter(t<2000) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#significant - fit of model is good

#Case 2. N(t) = K
#looking at plateau/equilibrium

data_subset2 <- growth_data %>% filter(t>2000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
#significant - fit of model is good
