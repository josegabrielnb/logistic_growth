#Script to plot the logistic growth data

#Load the experiment data into the r script 
growth_data <- read.csv("experiment1.csv")

#Install and load the plotting functions 
install.packages("ggplot2")
library(ggplot2)

#Plot the logistic growth model (t against N)
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#Plot the graph of t against N with a semilog scale on the y axis 

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
