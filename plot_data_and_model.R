#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))  #calculate N using logistic growth model equation
  
  return(N)
  
}

N0 <- 975.55 #initial population size
  
r <- 0.01004 #growth rate
  
K <- 60000000000 #carrying capacity

ggplot(aes(t,N), data = growth_data) +  #create the logistic growth plot
  
  geom_function(fun=logistic_fun, colour="red") +  #add a red curve showing expected behaviour of the model based on estimated parameters
  
  geom_point()

  #scale_y_continuous(trans='log10')


#make a list of required packages and save 
sink(file = "package-versions.txt")
sessionInfo()
sink()



