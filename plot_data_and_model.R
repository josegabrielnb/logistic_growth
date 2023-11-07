#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

growth_data

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#Let's set the initial population size
N0 <- growth_data$N[growth_data$t == 0] 
N0
  
r <- 1.5 # Let's set the groth rate
  
K <- 60000000030 # Let's set the carrying capacity
log(60000000030)

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  scale_y_continuous(trans='log10')


