#Script to plot data and model

growth_data <- read.csv( "/cloud/project/experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #
  
r <- 0.001004 #got this from the gradient of model 1 
  
K <- 60000000000 #got this from the intercept of model 2 

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

#Making a list of packages required and saving them in a file called package - versions.txt
sink(file = "package-versions.txt")
sessionInfo()
sink()


