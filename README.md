# logistic_growth
R scripts for a reproducible analysis of logistic growth
First - fitting a linear model

install.packages('dplyr')
library(dplyr)

growth_data <- read.csv("experiment1.csv")
head(growth_data)

#Case 1. K >> N0, t is small
# gicing me linear model stuff  

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# output = Multiple R-squared:  0.6509,	Adjusted R-squared:  0.6466 
# F-statistic: 152.9 on 1 and 82 DF,  p-value: < 2.2e-16
# NO intercept = 6.883 <- need to use exponential when graphing
# t for slope = r, here = 1.004e-02 


#Case 2. N(t) = K
# gives the carrying capacity

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# output - Residual standard error: 37030 on 32 degrees of freedom
# gives caryring capcaity K - the intercept
#  6.000e+10 



# Now adding the code for plotting this model

growth_data <- read.csv("experiment1.csv")
head(growth_data)

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time") +
  
  ylab("bacterial abundance") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time") +
  
  ylab("bacteria innit") +
  
  scale_y_continuous(trans='log10')
