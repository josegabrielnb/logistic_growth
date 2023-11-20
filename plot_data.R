#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")
# Putting in data from experiment 1 
install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  # calling on data from the imported file
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
