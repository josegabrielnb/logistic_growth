# Script to make a graph comparing exponential and logistic growth curves

## Install and load the necessary packages
install.packages(c("gridExtra", "tidyverse"))
library(gridExtra)
library(tidyverse)

## Previous parameter estimates
N0 <- exp(8.517e+00)

r <- 4.997e-03 

K <- 4.998e+09

## Exponential growth function

exp_function <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
  
}

## Logistic growth function

log_function <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

## Generate data points for plotting

t <- seq(0, 4980, length.out = 84) # following the same time sequence as
  # experiment
N_exp <- exp_function(t)
N_log <- log_function(t)

## Create tibbles
exp_growth_data <- tibble(
  t = t,
  N = N_exp
)

log_growth_data <- tibble(
  t = t,
  N = N_log
)


## Plot the exponential growth curve

exp_growth_curve <- ggplot(aes(t,N), data = exp_growth_data) +
  
  geom_point() +
  
  ylim(0, 5e+9) # to make the scale the same as log growth
  

## Plot the logistic growth curve 
log_growth_curve <- ggplot(aes(t,N), data = log_growth_data) +
  
  geom_point() +
  
  ylim(0, 5e+9)

## Code to compare the graphs

grid.arrange(exp_growth_curve, log_growth_curve, ncol=2)

## Plot the two on the same graph

combined_graph <- ggplot() +
  geom_point(data = exp_growth_data, aes(x = t, y = N_exp, color = "exp_growth_data")) +
  geom_point(data = log_growth_data, aes(x = t, y = N_log, color = "log_growth_data")) +
  scale_color_manual(values = c("exp_growth_data" = "orange", "log_growth_data" = "cornflowerblue")) +
  ylim(0, 5e+09) +
  labs(title = "Graph comparing exponential and growth curves",
       x = "t ",
       y = "N",
       color = "Growth data") +
  theme_bw()

print(combined_graph)

## Save the graph

ggsave("exp_log_growth_curves_fig.png", combined_graph, width = 12, height = 8, units = "in")
## List relevant packages
sink(file = "package-versions.txt")
sessionInfo()
sink()
