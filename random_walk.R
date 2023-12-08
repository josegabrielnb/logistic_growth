#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

# This function creates a 2-Ddataframe with an x and y axis
# It creates a series of steps based on runif - a function of randomness
random_walk  <- function (n_steps) {
?data.frame()
?rep()
# This creates a dataframe that replicates x and y values based on the value of n_steps
  df <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps)
# This code sets the first value of the data frame as a list
  df[1,] <- c(0,0,1)
  # this starts at 2 as the for look considers i-1 so must be >1
  for (i in 2:n_steps) {
    
    h <- 0.25
  # runif creates a random angle value from 0 to 2pi which translates to 0 to 360 degrees
    angle <- runif(1, min = 0, max = 2*pi)
 # codes for horizontal direction
    df[i,1] <- df[i-1,1] + cos(angle)*h
  # codes for vertical direction
    df[i,2] <- df[i-1,2] + sin(angle)*h
  # codes for movement 
    df[i,3] <- i
  # by the end of the for loop - the data frame is filled from [1,1] to [500,3]
  # so for each value from time = 1 to time = 500 a change is made to angle and spaces moved by the dataframe

  
}
  return(df)

}
?runif
# This plot uses to randomly generated data frame to create two plots
random_plot <- function() {
# This calls random_walk twice for two data sets
  data2 <- random_walk(500)
  data1 <- random_walk(500)
  data1
  
# This plot is using the dataframe generated randomly and colour codes the path based on distance from the start point
plot1 <- ggplot(aes(x = x, y = y), data = data1) +
# this code changes the colour over time
  geom_path(aes(colour = time)) +
# this creates the colour sceme of the graph
  theme_bw() +
# this code labels the axes 
  xlab("x-coordinate") +
  
  ylab("y-coordinate")


# This does the same as above with the second plot
plot2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")
# This allows us to put both plots on the same figure
grid.arrange(plot1, plot2, ncol=2)
}
# Now we can run the code with just this function
random_plot()




 #I observe that the paths have a random starting point and move in random directions 
 #The paths do not jump from one posiiton to another and as 
 

 #Seed is a vector that sets up an RNG containing integers
 #Random seed can take different values - set.seed() takes on an integer value
 #once a seed is set - running the code again will give the same code
?set.seed
