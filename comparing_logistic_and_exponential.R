#creating a graph comparing the exponential and logistic growth curves 

#copying in the script for the logistic curve
growth_data <- read.csv("/cloud/project/experiment3.csv")#inserting file name to read

install.packages("ggplot2")
library(ggplot2)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#function for the exponential growth curve 
exponential_fun <- function(t) {
  N <- N0*exp(r*t)
}

#setting the initial population size:
N0 <-4879 #value when t=0
N0

# now to set the growth rate: 
r <- 4.964e-03 #gradient from model 1

#setting the carrying capacity
K <- 4.998e+09 #intercept from model 2

ggplot(aes(x = t ,y = N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun = exponential_fun, colour "blue") +
  #adding in the exponential function
  
  geom_point()
#scale_y_continuous(trans='log10')


  


