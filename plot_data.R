#Script to plot the logistic growth data

growth_data <- read.csv("experiment3.csv")

install.packages("ggplot2")
library(ggplot2)

#Plotting the logistic growth data
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#Replotting data but with y axis logged
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
