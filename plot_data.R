#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")
# Putting in data from experiment 1 
install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  # calling on data from the imported file
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()


ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')

# This plot transforms our n value into log(n), this is done so that we can look for a linear relatinshiop between log(n) and t