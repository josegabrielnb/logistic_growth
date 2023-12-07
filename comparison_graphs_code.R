#Script to plot data and model

growth_data <- read.csv("experiment2.csv")
#This line reads in the necessary data file

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
#These lines define a logistic function that allows me to generate the N values for the logistic growth curve

N0 <- 1879
  
r <- 0.031
  
K <- 1e+09
#These three lines define the various values I calculated in the first question



exp_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
}
#These lines define an exponential function that allows me to generate the N values for the exponential growth curve


#I use the function ggplot() in combination with the functions geom_function(), scale_y_continuous(), labs(), and theme()
ggplot(aes(t,N), data = growth_data) +
  #ggplot() creates the axis
  
  geom_function(fun=logistic_fun, colour="red") +
  
  
  geom_function(fun=exp_fun, colour="blue") +
  #geom_function() plots the two line functions
  
  
  #I thought that points on the graph obscured the line, so I removed the geom_point() function
  
  
  scale_y_continuous(trans='log10') +
  #This makes the graph more comparable by taking the log of the y values for both functions
  
  labs(x="Time (minutes)", y="Population size", title="Comparison of logistic and exponential growth curves") +
  #labs() adds axis labels
  
  theme_bw()
  #theme_bw() adds a theme to make the graph more visible/aesthetically pleasing




#I decided to create the graph again, but along with a y scale limit, to be able to see the dynamics of the two functions a tiny bit better at low t values
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +

  geom_function(fun=exp_fun, colour="blue") +

  scale_y_continuous(trans='log10') +

  labs(x="Time (minutes)", y="Population size", title="Comparison of logistic and exponential growth curves") +
  
  theme_bw() + 
  
  ylim(0, 1.1e+10)
  #This line limits the y axis scale to between 0 and 1e+10
  


