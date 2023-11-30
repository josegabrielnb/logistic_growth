#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment1.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N)) #take the natural log of N

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
  #In model1, the y-intercept represent ln(N0), so N0 is e to the power of 6.88
  #The slope (1*10^-2) represents r

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
  #In model 2, y-intercept represents carrying capacity K.
