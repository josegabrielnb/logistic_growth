
growth_data <- read.csv("experiment3.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
  
  }
        
        N0 <- exp(8.542e+00) #N0 = exp(intercept from model1)
        
        r <- 4.964e-03 # r = gradient from model1
        
        K <- 4.882e+09 # K = intercept from model2
        
        install.packages("ggplot2")
        
        library(ggplot2)
        
        ggplot(aes(x=t, y=N), data = growth_data) +
          
          geom_function(fun=logistic_fun, colour="red") +
          
          geom_function(fun=exponential_fun, colour="green")
        
        #scale_y_continuous(trans='log10')
        