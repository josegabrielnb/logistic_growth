#Script to plot data and model

library(ggplot2) 

growth_data <- read.csv("experiment3.csv")

logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

N0 <- exp(8.512e+00) # 8.512e+00 was the number that was derived from the log transformation
# not from the original model and so to make it back into the number from the original transformation 
# you need to put the number into an exponential 

r <- 5.007e-03 #

K <- 4.882e+09 #

ggplot(aes(t,N), data = growth_data) +
  geom_function(fun=logistic_fun, colour="red") +
  geom_point()
scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()



