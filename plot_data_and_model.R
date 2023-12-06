#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
} #this is the entire model - we are now providing the inputs that start and run the model

N0 <- 995.256 #this is obtained from output of model 1, in which you do e to the power of the estimate of intercept to get N0 
#exp(6.903e+00) 

r <- 9.990e-03 #this is the output from model 1, it is the estimate of t 
  
K <- 6.000e+10 #exp not needed - K has not been under the ln function, obtained from model 2 estimate

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')



sink(file = "package-versions.txt")
sessionInfo()
sink()

