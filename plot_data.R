#Script to plot the logistic growth data

#create a data frame by reading in the data from the experiment 1 csv file
growth_data <- read.csv("experiment1.csv")

#install and load the packages required to plot logistic data
install.packages("ggplot2")
library(ggplot2)

#produces a ggplot with t (time) on the x-axis and N (population size) on the y-axis
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() + #adds points to represent data on the plot
  
  xlab("t") + #sets x-axis labels as t
  
  ylab("y") + #sets y-axis labels as y
  
  theme_bw() #applies the black points and white background theme to the plot 

#produces a logistic plot y = N, x = t


ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10') #transforms the y-axis to logarithmic scale using base 10 logarithm

#produces a semi-log transformed plot on y-axis for logistic growth of population
#using this transformation is helpful for linearising the exponential growth phase of logistic growth data
