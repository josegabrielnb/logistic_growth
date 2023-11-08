#Script to compare exponential and logistic growth curves
#read in data
growth_data <- read.csv("experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
exponential_fun <- function(t){
  
  N<-N0*exp(r*t)
  
  return(N)
}#exponential function

N0 <- 1919.84551337 # e^y intercept from last time

r <- 0.0301927

K <- 1.000e+09

t<-1:5000
ggplot(aes(t,N), data = growth_data)+
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun, colour="blue") +
  coord_cartesian(xlim =c(0, 5000), ylim = c(0, 1000000000))+
  ylab("Number of cells")+
  xlab("Time/Mins")
