#Script to estimate the model parameters using a linear approximation

## Install and load necessary packages
install.packages("dplyr")
library(dplyr)

## Load in data
growth_data <- read.csv("experiment3.csv")

#Case 1. K >> N0, t is small
## We are interested in estimating the model's parameters; we can begin by
  ## looking at when the carrying capacity, K, is much larger than N0, the initial
  ## population size. Therefore, we can use this section to calculate what r, 
  ## instantaneous growth rate is. (See observation 1)
  ## See the semi-log plot to find what value to use for t < ???
  ## This is fitting a slope to see what r is

data_subset1 <- growth_data %>% filter(t<2000) %>% mutate(N_log = log(N))
## Because the semi-log plot shows us that growth is linear up until t=2000

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
## This gives an estimate of the slope (i.e. growth rate) = 4.997e-03 
## Intercept (i.e. ln(N0)) = 8.517e+00

#Case 2. N(t) = K
## This is fitting a horizontal line to find what K is

data_subset2 <- growth_data %>% filter(t>4000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

## This gives an estimate for the intercept (i.e. K) = 4.998e+09

