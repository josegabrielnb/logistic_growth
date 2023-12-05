#Script to plot data and model

#Install and laod packages 
install.packages("dplyr")
library(dplyr) 
install.packages("tidyverse")
library(tidyverse)

#Load the data into the script 
growth_data <- read.csv("experiment1.csv")

#Create a function that performs the logistic model on the data 
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#Results from the linear model
N0 <- 986.5 #this is the first value when you look at the time t=0
  
r <- 0.0100086 #where K >> N0, t is small
  
K <-  60000000000  

#Plot the data, adding the logistic model to the graph
ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") + #we made the logisitc model above 
  
  geom_point() + 
  
  scale_y_continuous(trans='log10')



