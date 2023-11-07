#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 986.507472309375 # the log of the NO is in the previous "fit linear model" data "6.8941709". Needed to do the antilog using e as the base (not 10!!!)
  
r <- 0.0100086 #the intercept of the slope
  
K <- 60000000000 #the intercept of the second model from the "fit linear model" part of this practical

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10') #the red line should overlap

#By using these values that I found from the 2 linear models, this logistic growth can be recreated

sink(file = "package-versions.txt")
sessionInfo()
sink()