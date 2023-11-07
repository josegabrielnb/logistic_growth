#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("/cloud/project/experiment2.csv") #file.choose()

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<500) %>% mutate(N_log = log(N)) # t is smaller than 500, before the plateau is reached

model1 <- lm(N_log ~ t, data_subset1) #looking at a y=mx+c
summary(model1)
#this is the line at the part where there is exponential growth - intercept is 7.85 and gradient is 0.028.

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1620) # t is equal to the carrying capacity

model2 <- lm(N ~ 1, data_subset2) #looking at a horizontal line so use of ~1
summary(model2)

#this shows us k