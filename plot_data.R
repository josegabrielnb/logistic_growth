#Script to plot the logistic growth data

growth_data <- read.csv("experiment2.csv")

install.packages("ggplot2")
library(ggplot2)

#Plots the data
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time") +
  
  ylab("Number of cells") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time") +
  
  ylab("log(Number of cells)") +
  
  scale_y_continuous(trans='log10')#converts the y scale to a log scale
