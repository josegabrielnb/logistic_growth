#load the data 
growth_data <- read.csv("experiment1.csv")

#install and load the packages 
install.packages("tidyverse")
library(tidyverse)
install.packages("gridExtra")
library("gridExtra")  

#create an exponential function 
exp_fun <- function(t){
  N<-N0*exp(r*t)
}

#create a logistic function 
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#plot a graph containing the data, the logistic growth model and the exponential growth model 
normal_plot <- ggplot(aes(t, N), data = growth_data) +
  geom_function(fun=logistic_fun, aes(color = "Logistic")) +
  geom_function(fun=exp_fun, aes(color = "Exponential")) + 
  ylim(0,65000000000) +
  geom_point(size=0.6) + 
  scale_color_manual(values = c("Logistic" = "red", "Exponential" = "blue"),
                     name = "Growth Type") + 
  labs(title = "Comparison of Logistic and Exponential Growth Curves",
       subtitle = "Data from Experiment 1",
       x = "Time (s)", 
       y = "Population Size") + 
  theme(legend.position = "bottom", legend.justification = "center", 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13), 
        plot.title = element_text(size = 13, face = "bold"))

#plot a semilog graph containing the data, the logistic growth model and the exponential growth model 
log_plot <- ggplot(aes(t, N), data = growth_data) +
  geom_function(fun=logistic_fun, aes(color = "Logistic")) +
  geom_function(fun=exp_fun, aes(color = "Exponential")) + 
  geom_point(size=0.6) + 
  scale_color_manual(values = c("Logistic" = "red", "Exponential" = "blue"),
                     name = "Growth Type") + 
  labs(title = "Comparison of Logistic and Exponential Growth Curves on a SemiLog plot",
       subtitle = "Data from Experiment 1",
       x = "Time (s)", 
       y = "Log(N)") + 
  scale_y_continuous(trans='log10') + 
  theme(legend.position = "bottom", legend.justification = "center", 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13), 
        plot.title = element_text(size = 13, face = "bold"))

#Join the plots togather 
grid.arrange(normal_plot, log_plot, ncol = 2)  

