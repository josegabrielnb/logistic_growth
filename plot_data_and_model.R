#Script to plot data and model

growth_data <- read.csv("experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 1919.84551337 # e^y intercept from last time
  
r <- 0.0301927
  
K <- 1.000e+09

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() 

  #scale_y_continuous(trans='log10')

#sink(file = "package-versions.txt")
#sessionInfo()
#sink()
