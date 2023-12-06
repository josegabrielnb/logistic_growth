
#load ggplot to plot the graph  

library(ggplot2)

#reading in growth data CSV : 

growth_data <- read.csv("experiment1.csv")

#function for the logistic growth of bacteria : 

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
} 


#function for the exponential growth of bacteria : 

exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
} 

extended_time <- seq(0, 20, by = 0.1)


#parameters of previously found estimates 

N0 <- 995.256 

r <- 9.990e-03 

k <- 6.000e+10 

#Generating time value sequence from 0-4980 (parameter of t given in Q2)

time_values <- seq(0, 4980, by=1) 

#Calculating corresponding growth values for logistic and exponential functions

log_growth <- logistic_fun(time_values)

exp_growth <- exponential_fun(time_values)

#data frame of time values, containing an N value for each function at each time point

data <- data.frame(t = time_values, N_log = log_growth, 
                   N_exp = exp_growth)

#plot the graph to compare exponential and logistic growth 

ggplot(data, aes(x = t)) +
  geom_line(aes(y = N_log, colour = "Logistic Growth"), size = 1.2) +
  geom_line(aes(y = N_exp, colour = "Exponential Growth"), size = 1.2) +
  ylim(0, 10e+10) + 
  labs(title = "Exponential vs Logistic Growth",
       x = "Time (mins)",
       y = "N (#cells)",
       color = "Growth curve") + 
  scale_color_manual(values = c("red", "orange"), 
                     labels = c("Logistic Growth", "Exponential Growth")) +
  theme_linedraw() +
  theme(plot.title = element_text(hjust = 0.5))
