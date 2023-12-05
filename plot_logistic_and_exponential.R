# Comparing the exponential and logistic growth curves

library(ggplot2)

growth_data <- read.csv("/cloud/project/data/experiment1.csv")

# Parameters
N0 <- 6.888e+00 # the starting number of bacteria

r <- 1.002e-02 # the rate of growth

K <- 6.00e+10 # the carrying capacity

# Logistic function
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

# Exponential function
exponential_fun <- function(t) {
  
  N <- N0*exp(r*t)
  
  return(N)
  
}

# Plot
ggplot(aes(t,N), data = growth_data) +

  geom_function(fun=logistic_fun, colour="red") +
  
  geom_function(fun=exponential_fun, colour="blue") +
  
  coord_cartesian(ylim = c(0, 6e+10)) +
  
  geom_point() 





