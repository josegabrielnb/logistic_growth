#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/experiment1.csv")
file.choose()

install.packages("ggplot2")
library(ggplot2)


ggplot(aes(t,N), data = experiment1) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,???), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
