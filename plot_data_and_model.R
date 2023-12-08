#Script to plot data and model
library(ggplot2)
growth_data <- read.csv("experiment1.csv")
#Calling the data from experiment 1
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)

}

N0 <- exp(6.8421256)
r <- 0.0103516
K <- 6.000e+10 

# Making a function that gives N value at a given time
#provided that we know K, N0 and r 



#We are inputting the values that we obtained by calculating
#r and K values for when t was small (<1000) and for when t was larger
#(>3000)


ggplot(aes(t,N), data = growth_data) +
  # here the function logistic func represents our model of the data based on our values
  geom_function(fun= logistic_fun , color="red") +
  
  geom_point()
  
  #scale_y_continuous(trans='log10') +
   #geom_abline(intercept = 6.883, slope = 1.004*exp(-2))


#This graph shows us that model is correct because when
#we input our values from fit_linear_model we get the same graph we had 
#in our plot_data graph

# This function returns a value for an exponential graph using our parameter values at t
exponential_fun <- function(t) {
  
  
  N <- N0 *exp(r*t)
  return(N)
  
}

exponential_fun(4980)

# This gives a value of 2.289804exp(25), far larger than the model predicted under logistic growth


