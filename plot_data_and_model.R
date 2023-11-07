#Script to plot data and model

growth_data <- read.csv("experiment1.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 972 # (e^(6.883) as this was our estimate for the intercept on the model on the fit linear model. as the intercept is the number of individuals at time 0. but we log transformed the data so it would be e^ to 6.8 to go back 
  
r <-  1.004e-02#dont need to log transform
  
K <- 6.000e+10 #used the intercept output from the second linear model 

ggplot(aes(t,N), data = growth_data) +
  
geom_function(fun=logistic_fun, colour="red") + 
  
  geom_point()
  
  scale_y_continuous(trans='log10')  



  
#making it log so it is linear 
  

  
  geom_function(fun=logistic_fun, colour="red") + 
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
    
  scale_y_continuous(trans='log10') 
  
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  
  git config --global user.email "<YOUR_EMAIL>"
  
  
