#Script to plot data and model

install.packages("ggplot2")

library(ggplot2)

growth_data <- read.csv("experiment2.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(11) 
  
r <- 0.01317 
  
K <- 1.000e+09

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  scale_y_continuous(trans='log10')

#Make a list of packages that have been used!
sink(file = "package-versions.txt")
sessionInfo()
sink()

