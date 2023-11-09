#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("/cloud/project/experiment3.csv")

#Case 1. K >> N0, t is small
# assuming K is much larger than N0 to estimate r
# use the semi-log plot to find the value to use for t<???
data_subset1 <- growth_data %>% filter(t<2500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
# we can use the intercept value)



#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>4000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#can use the intercept value (4.998e+09) as K
  # tis is where the growth plateaus