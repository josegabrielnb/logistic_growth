###Script to estimate the model parameters using a linear approximation

#install and laod the piping functions 
install.packages("dplyr")
library(dplyr)

#read the data into r 
growth_data <- read.csv("experiment1.csv")

## Case 1. K >> N0, t is small
# When K >>N0, the population growth is exponential 
# Using the growth data 
# Filter so we only have t values up to 1500
# This means that t is restricted to the region of exponential growth (chosen by looking at the semilog graph of N against t)
# mutate() adds a new column to the data frame called N_log containing the log of N
# Create a data subset called data_subset2 where we only have data where K >> N0 and there is a new column called N_log containing log(N)
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))
# Using the new data frame containing the N_log column, plot a linear model with t and N_log
model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
# This tell us that the initial population size, N0 =e^6.8941709=986.5
# The growth rate, r = 0.0100086

## Case 2. N(t) = K
# This occurs as time tends to infinity, the population size (Nt) becomes equal to the carrying capacity (K)
# You want t to be bigger than the carrying capacity at the linear model (where the line plataus)
# This occurs at t>3000
# Create a data subset called data_subset2 that filters the data so we only have values where N(t) = K
data_subset2 <- growth_data %>% filter(t>3000)
# Plot a linear model with N 
model2 <- lm(N ~ 1, data_subset2)
summary(model2)
# K = 60000000000
