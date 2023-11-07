#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

exp(6.883e+00) #to work out n0 =

N0 <- 6.883e+00 #
  

r <-  1.004e-02 #
  
K <- 6e+10 #

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()


