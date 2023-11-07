#Script to plot data and model

growth_data <- read.csv("Data.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 4879 #this is the first value when you look at the time t=0
  
r <- 4.964e-03 #where K >> N0, t is small, MODEL 1 use the t value 
  
K <-  4.998e+09 #Using model 2,  N(t) = K, since we want to look at where it has plataued so look at the intercept since it is a number rather than a rate of change  

ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") + #we made the logisitc model above 
  
  geom_point()

  #scale_y_continuous(trans='log10') # if we add this it makes the other graph with the linear model!
  #Still plot the data but with the logistic model added 


