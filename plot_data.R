#Script to plot the logistic growth data

## Load in data
growth_data <- read.csv("experiment3.csv")

## Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)

## This is to plot the bacterial growth over time
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

## This is a semi-log plot that has transformed the y axis; this is useful to
  ## see initial growth
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
