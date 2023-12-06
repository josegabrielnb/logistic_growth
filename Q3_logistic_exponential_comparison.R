# Installing packages: 
install.packages(ggplot)
library(ggplot2)

# Naming the data set
growth_data <- read.csv("experiment1 (2).csv")

# Generating the logistic growth model
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
}

N0 <- 1330.74 #

r <- 0.0095218 #

K <- 6e+10 #

# Creating the logistic growth curve plot
logistical_plot <- ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  ggtitle("Logistic Growth")

# Generating the exponential growth model
exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
}

N0 <- 1330.74 #

r <- 0.0095218 #

K <- 6e+10 #

# Creating the exponential growth curve plot
exponential_plot <- ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=exponential_fun, colour="blue") +
  ggtitle("Exponential Growth")

# Comparing the logistic and exponential growth plots
install.packages(gridExtra)
library(gridExtra)
grid.arrange(logistical_plot, exponential_plot, ncol = 2)
