#Script to plot the logistic growth data

growth_data <- read.csv("experiment2.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,log(N)), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("log(N)") +
  
  scale_y_continuous(trans='log10')

#By linearizing the growth period of the bacteria we can find the parameters to determine the intrinsic growth rate of the bacteria.
