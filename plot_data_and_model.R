#Script to plot data and model

growth_data <- read.csv("experiment1.csv")
head(growth_data)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

# got all numbers from the prev graph -carrying capacity
# was also from here = not sure what it means tho

N0 <- exp(6.883) # its the initial population size

r <-  1.004e-02  # its the growth rate 

K <- 6.000e+10   # carrying capacity yuh

ggplot(aes(t ,N ), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

#scale_y_continuous(trans='log10')

sink(file = 'package-versions.txt')
sessionInfo()
sink()

# git config --global user.email "hannah.ugboma@some.ox.ac.uk"


