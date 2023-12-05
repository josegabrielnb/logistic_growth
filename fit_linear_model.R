#Script to estimate the model parameters using a linear approximation

# library(dplyr) # Calling a common data manipulation package

growth_data <- read.csv("experiment2.csv") # Reading in the data as the object growth_data

#Case 1. K >> N0, t is small


# t is small - only calling data points less with t < 100, which for this purpose will only consider t = 0 and t = 60. 
# Also creating an additional column called N_log, which is the log-transformed populaiton size.

data_subset1 <- growth_data %>% filter(t<100) %>% mutate(N_log = log(N)) 

# Creating a simple linear model with t as explanatory and log N as the response variable, from only that subset where t < 100. 

model1 <- lm(N_log ~ t, data_subset1)
summary(model1) # Finding parameters from the model - intercept = 7.53849 and slope = 0.03108

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1000) # Doing the same but only at high values of t (where carrying capacity has been reached) - and this time not using a log value of N

model2 <- lm(N ~ 1, data_subset2) # N is the response variable, explanatory variable is set to 1 because we wouldn't expect t to have any bearing on growth when N = K
summary(model2) # Parameters: intercept = 1.000e+09
