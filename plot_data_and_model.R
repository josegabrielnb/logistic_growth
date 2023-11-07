#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #This is the value when t=0.
  
r <-  9.990e-03 #From model 1 output: this is the estimate for our t value. 
  
K <- 6e+10 #This is the value at which the population becomes constant

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

#This produces a line that allows us to assess the fit of the model to your data graphically
#It appears that the model fits the data well. 
