#Script to plot data and model

growth_data <- read.csv("experiment3.csv")

## These are the parameters

N0 <- exp(8.517e+00)
## This is found by looking at the intercept from the first graph
## Remember to inverse the log! Use exp() function

r <- 4.997e-03 

K <- 4.998e+09

## This is to fit the model using our parameters
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
## Place the cursor over the logistic_fun() section to run the whole thing

## This is to plot the first plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

## This is to plot the semi-log plot
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="green") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10')

## List relevant packages
sink(file = "package-versions.txt")
sessionInfo()
sink()

