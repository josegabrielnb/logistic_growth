#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment1.csv")
# Calling the data from experiment 1
#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))
# Lookign at times where K is greater than sstarting N values
model1 <- lm(N_log ~ t, data_subset1)


summary(model1)

#Case 2. N(t) = K
# Looking at cases where we are at carrying capaicty 
data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
