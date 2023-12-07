#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv") #read & store data 

install.packages("ggplot2")
library(ggplot2)  #install & load packages 

ggplot(aes(t,N), data = growth_data) +  #create a scatter plot of data
  
  geom_point() +
  
  xlab("t") +  #label the axes
  
  ylab("y") +
  
  theme_bw()  #black-and-white theme for plot

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')  #log transform y-axis values
