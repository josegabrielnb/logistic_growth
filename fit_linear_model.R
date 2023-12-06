#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")

library(dplyr)

growth_data <- read.csv("experiment3.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<2500 # corresponds to the end of the linear section of the semilog-plot
                                       ) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000 # corresponds to the start of the constant section of semilog-plot
                                       ) 

model2 <- lm(N ~ 1, data_subset2)
summary(model2)



sink(file = "package-versions.txt")
sessionInfo()
sink()

