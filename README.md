# logistic_growth
R scripts for a reproducible analysis of logistic growth
First - fitting a linear model

install.packages('dplyr')
library(dplyr)

growth_data <- read.csv("experiment1.csv")
head(growth_data)

#Case 1. K >> N0, t is small
#gicing me linear model stuff  

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#output = Multiple R-squared:  0.6509,	Adjusted R-squared:  0.6466 
#F-statistic: 152.9 on 1 and 82 DF,  p-value: < 2.2e-16
#NO intercept = 6.883 <- need to use exponential when graphing
#t for slope = r, here = 1.004e-02 


#Case 2. N(t) = K
#gives the carrying capacity

data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

#output - Residual standard error: 37030 on 32 degrees of freedom
#gives caryring capcaity K - the intercept
#6.000e+10 



# Plotting this model

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


  # Now adding code for the final plot and model 

  #Script to plot data and model

growth_data <- read.csv("experiment1.csv")
head(growth_data)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#got all numbers from the prev graph -carrying capacity
#was also from here = not sure what it means tho

N0 <- exp(6.883) # its the initial population size

r <-  1.004e-02  # its the growth rate 

K <- 6.000e+10   # carrying capacity yuh

ggplot(aes(t ,N ), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

#scale_y_continuous(trans='log10')

sink(file = 'package-versions.txt')
sessionInfo()
sink()

#git config --global user.email "hannah.ugboma@some.ox.ac.uk"

# Results for each section of the code !
The linear model code oculd be used to calculate the intercept, or N0, which gave an estimate in R of 6.883e, or an intercept of 6.33 - 
this model also gave the slope, 1.004e-02 in the output, or 0.01004.

The semmi model could be used to obtain the output for carrying capacity K using this previous data, which gave an output in R of 6.000e+10, or 60,000,000,000 bacteria in this system.

therefore, the reults of all of this code was:
- N0, initial size of population where growth rate = 0 - 6.883e
- r, growth rate = 0.01004
- k, carrying capacity = 60,000,000,000





