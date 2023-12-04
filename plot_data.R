#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/data/experiment1.csv")

install.packages("ggplot2")
library(ggplot2)

# A plot of the growth data for experiment 1
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()


# A logarithmic plot of the growth data for experiment 1
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')


