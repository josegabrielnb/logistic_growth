#Script to estimate the model parameters using a linear approximation

#library(dplyr)

growth_data <- read.csv("Data.csv")

#Case 1. K >> N0, t is small
#Pick using the linear data from the model in the plot_data log graph
install.packages("dplyr")
library(dplyr)
data_subset1 <- growth_data %>% filter(t<2500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K
#You want t to be bigger than the carying capcity at the linear model (where it equilibriates)

data_subset2 <- growth_data %>% filter(t>4000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
