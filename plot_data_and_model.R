#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 1879 #take from excel spreadsheet
  
r <- 0.028 #take from gradient of first model
  
K <- 1.00e+09 #take from intercept of second model

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')






