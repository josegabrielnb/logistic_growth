#Script to estimate the model parameters using a linear approximation

#library(dplyr)
install.packages("dplyr")
library("dplyr")

growth_data <- read.csv("/cloud/project/experiment1.csv")
#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#intercept estimate is N0 so on calculator e^6.8941, use e based on equation
#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#itnercept estimate is K (carrying capacity) so on calculator e^6.000, use e based on equation
#when look at experiement 1 data, can see the maximum capacity (where it levels off) is around 5.9 so yes it looks like we have estimated correctly from the model. 