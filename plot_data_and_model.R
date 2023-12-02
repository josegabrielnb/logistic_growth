#Script to plot data and model

growth_data <- read.csv("experiment3.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 5000.306 #e^8.873 which was the intercept from model 1
  
r <- 4.997e-03 #raw gradient in linear log git model 1
  
K <- 4.882e+09 #intercept in linear model 2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

# Make a list of packages used and save them in a file called package-versions.txt

sink(file = "package-versions.txt")
sessionInfo()
sink()


## TESTING USING A DIFFERENT T
logistic_fun2 <- function(t) {
  
  N2 <- (N02*K2*exp(r2*t))/(K2-N02+N02*exp(r2*t))
  
  return(N2)
  
}

N02 <- 4988.426 #e^8.873 which was the intercept from model 1

r2 <- 5.020e-03 #raw gradient in linear log git model 1

K2 <- 4.944e+09 #intercept in linear model 2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun2, colour="red") +
  
  geom_point()





## TESTING USING A DIFFERENT T AGAIN THIS IS THE SECOND ONE
logistic_fun3 <- function(t) {
  
  N3 <- (N03*K3*exp(r3*t))/(K3-N03+N03*exp(r3*t))
  
  return(N3)
  
}

N03 <- 5000.306 #e^8.873 which was the intercept from model 1

r3 <- 4.997e-03 #raw gradient in linear log git model 1

K3 <- 4.984e+09 #intercept in linear model 2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun3, colour="red") +
  
  geom_point()