#Script to plot data and model

library(ggplot2)
growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(6.8941709) # this part needs to be turned from log back to normal number
  
r <- 0.0100086 # t number in second graph summary table (gradient)
  
K <- 5.996e+10 # intercept of second graph

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')


