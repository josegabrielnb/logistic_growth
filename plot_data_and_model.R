#Script to plot data and model
library(ggplot2)
growth_data <- read.csv("/cloud/project/data/experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 6.888e+00 #
  
r <- 1.002e-02 # 
  
K <- 6.00e+10 #

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  # scale_y_continuous(trans='log10')


