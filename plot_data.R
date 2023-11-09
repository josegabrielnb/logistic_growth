#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/experiment3.csv")

install.packages("ggplot2")
library(ggplot2)

#plotting in bacterial growth over time
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#semi-log plot (transformed the y-axis) to see initial growth
ggplot(aes(t,N), data = growth_data) +
 
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
