#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/experiment1.csv")

#install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) + #Added in data as our dataset 'growth_data'. Click on Plots in bottom right hand corner section (next to Files) to see plot.
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) + #Added in the y axis as 'N'.  This code will make a log graph of the graph above.
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')



