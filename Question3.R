#(20 points) Add an R script to your repository that makes a graph comparing the
#exponential and logistic growth curves (using the same parameter estimates you found).
#Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.

growth_data <- read.csv("experiment3.csv")
install.packages("crayon")
library(crayon)



# EXPONENTIAL

exponential_fun <- function(t) {
  Nt <- N0*exp(r*t) # Exponential equation is Nt = N0e^rt 
  return(Nt)}

N0 <- 5000.306 # Initial population size
r <- 4.997e-03 # Growth rate


# LOGISTIC 
logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t)) # Logistic equation 
  return(N)}

N0 <- 5000.306 
r <- 4.997e-03 
K <- 4.882e+09 # Carrying capacity


# COMBINING TO ONE GRAPH

ggplot(aes(t, N), data = growth_data) +
  geom_function(fun=exponential_fun, colour = 'purple') +
  geom_function(fun=logistic_fun, colour = 'darkgreen') +
  labs(title = 'Exponential vs Logistic Bacterial Growth', y = 'Population size (N)', x = 'Minutes (t)') +
  coord_cartesian(ylim = c(0, 5e+09)) 

# Y-axis log transformed

ggplot(aes(t, N), data = growth_data) +
  geom_function(fun=exponential_fun, colour = 'purple') +
  geom_function(fun=logistic_fun, colour = 'darkgreen') +
  labs(title = 'Log-transformed Exponential vs Logistic Bacterial Growth', y = 'Logarithm of Population size (log10(N))', x = 'Minutes (t)') +
  scale_y_continuous(trans='log10')
