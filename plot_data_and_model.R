#Script to plot data and model
library(ggplot2)
growth_data <- read.csv("/cloud/project/data/experiment1.csv")

# creating a function to model a logistic function with assigned values.
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 6.888e+00 # the starting number of bacteria
  
r <- 1.002e-02 # the rate of growth
  
K <- 6.00e+10 # the carrying capacity


# A plot of the data and the logistic model with the same N0, r and K.
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() 

  # scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()
