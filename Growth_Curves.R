# patchwork allows multiple graphs to be displayed on the same figure
library(patchwork)
source("plot_data_and_model.R")

# this code creates a ggplot with limits N0 to 5000

# this code plots the logistic functino onto the plot

# the code below does the same with an exponential function


# This code combines 
exponential <- base + geom_function(fun= exponential_fun , color="black")
exponential
logistic <- base + geom_function(fun = logistic_fun, color = "blue") 
combined <- logistic + exponential
combined

I estimated the volume of a genome iwth length kb length 3

  