#Script to plot data and model

growth_data <- read.csv("experiment3.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 5978.95 #e^8.873 which was the intercept from model 1
  
r <- 4.794e-03 #raw gradient in linear log git model 1
  
K <- 4.882e+09 #intercept in linear model 2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

# Make a list of packages used and save them in a file called package-versions.txt

sink(file = "package-versions.txt")
sessionInfo()
sink()


