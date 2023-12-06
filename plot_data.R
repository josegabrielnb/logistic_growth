#Script to plot the logistic growth data

growth_data <- read.csv("experiment3.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("time (min)") +
  
  ylab("N (# cells") +
  
  theme_bw()

ggplot(aes(t,log(N)), data = growth_data) +
  
  geom_point() +
  
  xlab("time (min)") +
  
  ylab("Log10 (N)") +
  
  scale_y_continuous(trans='log10')
