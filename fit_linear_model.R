#Script to estimate the model parameters using a linear approximation


install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment2.csv")

#Case 1. K >> N0, t is small

#When t is small the calculated value for r is 0.03 - when log(N) was used.
#Even though 0.03 is a low value - it is positive and even in small cultures can show explosive poputlation growth.

data_subset1 <- growth_data %>% filter(t<200) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
