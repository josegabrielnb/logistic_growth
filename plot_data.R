#Script to plot the logistic growth data

growth_data <- read.csv("experiment2.csv") # Reading in the data from csv 2

install.packages("ggplot2") # Installing ggplot 2, which we will use for plotting
library(ggplot2)

# Visualizing time vs population size

ggplot(aes(t,N), data = growth_data) + # Plotting the growth data with time on the x axis and population size on the y axis 
  
  geom_point() + # Adding individual data points to the graph
  
  xlab("t") + # Adding x label
  
  ylab("y") + # Adding x label
  
  theme_bw() # Setting the theme to black and white, removing gray background


# Plotting the same data on a log scale
# Same steps, but this time I log-transform the data. 

ggplot(aes(t,log(N)), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10') +
  
  theme_bw() # Added the same theme to make them match

  
