#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv") #download the correct file first

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw() #creating an original plot

ggplot(aes(t,log(N)), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10') #creating a transformed plot to assess linearity
