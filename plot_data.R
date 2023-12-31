#Script to plot the logistic growth data

growth_data <- read.csv("???")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = ???) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,???), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
