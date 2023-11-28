#Assign the parameters as estimated using the models fitted earlier

N0 <- 879 #Starting N

r <- 1.004e-02 #Growth rate

K <- 6e+10 #Carrying capacity

#Setting up the function for logistic growth, based on the solution to the
#logistic growth differential equation. This returns N for any given t. 
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#This function also returns N for any given t, but assuming that the population is
#always growing exponentially. This is derived by assuming that K will therefore
#be infinitely large, dominating the denominator of the above equation, leaving only K.
#But then the K in the numerator and that in the denominator cancel, leaving the below
#function.
exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
}

#These two functions can then be plotted using ggplot2

ggplot(data.frame(x = c(10, -10)), aes = (x = x)) + #Setting up an empty dataframe
  #... to allow the functions to be plotted
  geom_function(fun = logistic_fun, colour = "red") + #The logistic growth function
  geom_function(fun = exponential_fun, colour = "blue") + #The exponential growth function
  xlim(0, 5000) + #x axis limits
  scale_y_continuous(trans = "log10") + #log-transforming the y axis
  xlab("t (minutes)") +
  ylab("log(N)") +
  ggtitle("A comparison of logistic and exponential growth curves using 
          parameter estimates from our culture of E. coli") +
  geom_point(aes(x=x, y = -1, color = "Exponential")) + #Creating dummy data to create the legend
  geom_point(aes(x=x, y = -2, color = "Logistic")) + #More dummy data. Negative y values to make them not appear on the plot.
  scale_color_manual(values = c("Logistic" = "red", "Exponential" = "blue"),
                     name = "Growth curve") #Creating the legend using the dummy data
