#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 #Got this number from the Excel spreadsheet. Note: not from model1 intercept because this would be the intercept if the graph was linear and didn't curve when at the low y axis values
  
r <- 0.001004 #Got this number from gradient of model1
  
K <- 60000000000 #Got this number from the intercept of model2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')


sink(file = "package-versions.txt")
sessionInfo()
sink()
