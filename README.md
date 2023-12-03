# logistic_growth
R scripts for a reproducible analysis of logistic growth
First - fitting a linear model
```
install.packages('dplyr') # installing and libary packages
library(dplyr)

growth_data <- read.csv("experiment1.csv") # creating data tibble from CSV
head(growth_data)

#Case 1. K >> N0, t is small - the carrying capacity is much greater than the initial population size, and t time is also small
#This data will be used to create a linear model  

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N)) # filteirng the data subset for when t is greater than 1000, and using a pipe to mutate said data by log(N), a natural log

model1 <- lm(N_log ~ t, data_subset1) # this craetes the linear model using lm function. within the brackets: - lm(response variable ~ explanitory vairable, dataset). ~ is used to show the relationship between the 2 variables

summary(model1) # gives a summary and output of the results of the model
```
Here is a mini table similar to the results
output = Multiple R-squared:  0.6509,	Adjusted R-squared:  0.6466 
F-statistic: 152.9 on 1 and 82 DF,  p-value: < 2.2e-16
NO intercept = 6.883 <- need to use exponential when graphing
t for slope = r, here = 1.004e-02 

```
#Case 2. N(t) = K 
#gives the carrying capacity, however in this example t is large

data_subset2 <- growth_data %>% filter(t>3000) #creating data set where the t is graeter than 3000

model2 <- lm(N ~ 1, data_subset2) #creating a linear model for this data
summary(model2) #seeing the ouput of the data
```

Below are the answers obtained
output - Residual standard error: 37030 on 32 degrees of freedom
gives caryring capcaity K - the intercept
6.000e+10 



# Plotting this model -

```
growth_data <- read.csv("experiment1.csv")#creating tibble of growth data again
head(growth_data)#checking the data is correct

install.packages("ggplot2")#installing and adding packages to libary
library(ggplot2)

ggplot(aes(t,N), data = growth_data) + #the aes() contains the data to be plotted, t time on the x and N number of bacteria on the y. data = shows the data source
  geom_point() + #makes a scatter grapg
  xlab("time") +
  ylab("bacterial abundance") +#x/ylab are functions to add labels to the graog
 theme_bw()#This graph plots the time on the x axis against the bacterial abundance over time, and the output is a growth curve that platues out at the expected carrying capacity 6^10
 
 gplot(aes(t,N), data = growth_data) +
   geom_point() +
  xlab("time") +
  ylab("bacteria") +
  scale_y_continuous(trans='log10')#This graph also plots a semi graph for the data which can be used to work out initial population and carrying capacity
```

  # Now adding code for the final plot and model 

  #Script to plot data and model
```
growth_data <- read.csv("experiment1.csv")#reading the data again
head(growth_data)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}#creating a function to get N(t) using previously calculated carrying capacity and N0, 

#got all numbers from the prev graph -carrying capacity
#was also from here = not sure what it means tho

N0 <- exp(6.883) # its the initial population size

r <-  1.004e-02  # its the growth rate 

K <- 6.000e+10   # carrying capacity

ggplot(aes(t ,N ), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

#scale_y_continuous(trans='log10')

sink(file = 'package-versions.txt')
sessionInfo()
sink()# this graph is the same as the previous logistic curve graoh, however the ligustuic fun model whihc contains the Nt solution function has been added, which will give a line of best fit going through all the data points as a red line. 

#git config --global user.email "hannah.ugboma@some.ox.ac.uk"
```
Results for each section of the code !
The linear model code oculd be used to calculate the intercept, or N0, which gave an estimate in R of 6.883e, or an intercept of 6.33 - 
this model also gave the slope, 1.004e-02 in the output, or 0.01004.

The semmi model could be used to obtain the output for carrying capacity K using this previous data, which gave an output in R of 6.000e+10, or 60,000,000,000 bacteria in this system.

therefore, the reults of all of this code was:
- N0, initial size of population where growth rate = 0 - 6.883e
- r, growth rate = 0.01004
- k, carrying capacity = 60,000,000,000


# Calculating Population size when t = 4980
When assuming exponential growth want to use equation N(t) = N0e^rt
to carry out equation:

N(4980) = 6.883*exp(0.01004*4980)
3.565779e+22
or
35,657,790,000,000,000,000,000.

This is the logistic growth output
N(t) = (6.883*6.000e+10*exp(0.01004*4980))/(6.000e+10-6.883+6.883*exp(0.01004*4980))
- output = 6e+10
- or
- 60,000,000,000, or the carrying capacity

comparing these reuslts, its clear the exponential mode predicts a significantly larger amount of bacteria at the given time than just the logistic model.
This is motly likly due to the lack of carrying capacity in this model, the population will simply continue to double with no logorithmic control
