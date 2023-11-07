#Script to plot data and model
#first model evaluates when t is small => exploring exponential growth; gives r and No
#second model evaluates when No is constant, gives K
#comparing actual data relationship to modelled relationship
# => assessing the fit of linear model to non-linear data


growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 7.1855445 #this is the intercept from assessing model1 (intercept); when t = 0
  
r <- 0.0095218 #this is the slope from assessing model1 (t)
  
K <- 5.979e+10 #this is the intercept from assessing model2 (the plateau)

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") + #adding our model
  
  geom_point()+
  scale_y_continuous(trans='log10')

#almost a good fit


