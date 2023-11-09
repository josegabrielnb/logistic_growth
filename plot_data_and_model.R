#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment3.csv")#inserting file name to read

install.packages("ggplot2")
library(ggplot2)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#setting the initial population size:
N0 <-4879 #value when t=0
N0

# now to set the growth rate: 
r <- 4.964e-03 #gradient from model 1

#setting the carrying capacity
K <- 4.998e+09 #intercept from model 2

ggplot(aes(x = t ,y = N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +

  geom_point()


  #scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()
#this is to create a record of the packages and the version used 


