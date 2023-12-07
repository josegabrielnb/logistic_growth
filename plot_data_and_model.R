#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

#defining logistic growth function to identify population size (N) at a given time (t)
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}


#define the parameters of the logistic growth model using previous analysis:

N0 <- 1320 #intercept of plot 1, initial population size
  
r <- 0.0095218 # gradient of plot (given as t in lm), growth rate
  
K <- 5.979e+10 # intercept of plot 2, carrying capacity

#plot growth data with x-axis as t, and y-axis as N
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") + #logistic growth curve plotted
  
  geom_point() + #actual data points added to plot

  scale_y_continuous(trans='log10') #transforms y-axis to log scale

#plot shows there is good fit of the linear model to the actual data points 

#question 3 script:
N0 <- 1320
r <- 0.0095218
t <- 4980

N_t <- N0 * exp(r * t)
N_t
