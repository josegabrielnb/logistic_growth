#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")
head(growth_data)

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time") +
  
  ylab("bacterial abundance") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time") +
  
  ylab("bacteria innit") +
  
  scale_y_continuous(trans='log10')
