#Script to plot the logistic growth data

growth_data <- read.csv("experiment2.csv") #loading the experiment 2 data 

install.packages("ggplot2") #installing and loading packages to make plots
library(ggplot2)

#plotting a graph of the growth of E. coli over 5000 minutes
growth_plot <- ggplot(data=growth_data, aes(x=t, y=N))+
  geom_point()+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Time (m)", y="Population size of E. coli ", title="Growth of E. coli over 5000 minutes")
growth_plot

#plotting the log growth of E. coli over 5000 minutes
log_growth_plot <- ggplot(data=growth_data, aes(x=t, y=log(N)))+
  geom_point()+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Time (m)", y="log(Population size of E. coli)", title="Log growth of E. coli over 5000 minutes")
log_growth_plot
