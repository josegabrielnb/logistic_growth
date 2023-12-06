#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#whole thing we are trying to do is plot a line through this 'sigmoidal' curve 
#we are doing this as normally data with have variation, and to get idea of the normal relationship we have to try and get a line 

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')

#in order to get the curve, there are three parameters you need - N0, r, K - we are trying to estimate these so then we can plot this line 
#to find N0 and r look at the bit on graph where 0 very small - at start of graph as this is where the growth rate will be r - e.g., when you put bacteria in a culture, it grows very quickly - this is it growing at max growth rate (r) 
