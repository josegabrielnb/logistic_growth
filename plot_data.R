#Script to plot the logistic growth data

## Load in data
growth_data <- read.csv("experiment3.csv")

## Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

## This is to plot the bacterial growth over time
### We do this to visualise the growth of our dataset, experiment3
### It will help us estimate the parameters in the next file.
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

## This is a semi-log plot that has transformed the y axis
### This is useful to see initial growth
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
