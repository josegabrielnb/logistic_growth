#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

#The estimated parameters
N0 <- exp(6.883) 
r <- 10^(-2) 
K <- 6e+10

#Plot
ggplot(aes(t,N), data = growth_data) +
  geom_function(fun=logistic_fun, colour="red") +
  geom_point() +
  theme_bw()
  #scale_y_continuous(trans='log10')

#Make a list of the packages required and save them in a file called package-versions.txt
sink(file = "package-versions.txt")
sessionInfo()
sink()
