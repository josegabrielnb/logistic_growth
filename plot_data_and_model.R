#Script to plot data and model

library(ggplot2)

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #size at t = 0
  
r <- 1.004e-02 #from linear model subset 1, intrinsic growth rate when not limited by K. coefficient of t
  
K <- 6E+10 #size at asymptote

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')


