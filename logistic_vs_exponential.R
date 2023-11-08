growth_data <- read.csv("experiment3.csv")

#Create a function for logistic population growth
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 5125.585

r <- 4.964e-03

K <- 4.998e+09

#Create a function for exponential population growth
exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
  
}

#Plot graphs of these two functions together

g <- ggplot(aes(t,N), data = growth_data) +
  geom_function(fun=exponential_fun, colour = "blue") +
  geom_function(fun=logistic_fun, colour = "red") +
  ylim(0,7.5e+09) +
  annotate(geom = "label", x = 4000, y = 4e+09, label = "logistic", colour = "red") +
  annotate(geom = "label", x = 2000, y = 6e+09, label = "exponential", colour = "blue")

ggsave(filename = "exp_vs_log.png",
       plot = g,
       height = 10.5, width = 14.8,
       units = "cm")
