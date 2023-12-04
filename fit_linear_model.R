#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

growth_data <- read.csv("/cloud/project/data/experiment1.csv")

#Case 1. K >> N0, t is small
# # This model tells you the y intercept (the initial amount of bacteria)
data_subset1 <- growth_data %>% filter(t<1250) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K
# # This one tells you the carrying capacity, K.
data_subset2 <- growth_data %>% filter(t>2500)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
