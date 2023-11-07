#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) { #Creating a function that does is trying to simulate the growth?
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #The initial starting population number
  
r <-  1.004e-02 #The gradient of the linear model
#Take from the value from the linear model from the previous code, using the t value from the linear model summary
  
K <- 59999999923 #where it plateaus

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() 

  #scale_y_continuous(trans='log10')


