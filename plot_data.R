#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("N") +
  
  theme_bw()
##Sigmoidal curve produced here
## plotting the change in the number of cells overtime

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("log10(N)") +
  
  scale_y_continuous(trans='log10')
#Log transformation of the data
