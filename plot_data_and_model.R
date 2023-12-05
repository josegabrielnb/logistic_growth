#Script to plot data and model

growth_data <- read.csv("experiment2.csv") # Same data from earlier

# Writing a function: when you input a t value, output the N value using the specified values of K and r

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 2000 # Taken from model 1 - the intercept was 7.53849, but previously log-transformed, so it has to back-transformed to 2000
  
r <- 0.03 # Taken from model 1 - the slope of the linear model is 0.03108
  
K <- 1000000000 # Taken from model 2, where the intercept was 1* 10^9



# Creating our graph from earlier, but this time with the logistic model plotted onto it
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() + 
  
  theme_bw()

  #scale_y_continuous(trans='log10')


