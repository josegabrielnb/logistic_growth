# logistic_growth
R scripts for a reproducible analysis of logistic growth
First - fitting a linear model

anotations can be seen in the code as they begin with # 
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
Below is an output table generated from summary(model1)
```
output = Multiple R-squared:  0.6509,	
Adjusted R-squared:  0.6466 
F-statistic: 152.9 on 1 and 82 DF, 
p-value: < 2.2e-16
NO intercept = 6.883 <- need to use exponential when graphing
t for slope = r, 
here = 1.004e-02 
```
```
# Case 2. N(t) = K 
# Used to work out the carrying capacity, however in this example t is large

data_subset2 <- growth_data %>% filter(t>3000) # creating data set where the t is graeter than 3000, using a pipe and the filter function to extract data in which time is greater then 3000 and input it into the new data subset

model2 <- lm(N ~ 1, data_subset2) # creating a linear model for this new data subset data
summary(model2) #seeing the ouput of the data
```
Below are the results from the summary table:
output - Residual standard error: 37030 on 32 degrees of freedom
gives caryring capcaity K - the intercept
6.000e+10 

# Plotting this model -

```
growth_data <- read.csv("experiment1.csv") #creating tibble of growth data again
head(growth_data) #checking the data is correct

install.packages("ggplot2") #installing and adding packages to libary
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +           #the aes() contains the data to be plotted, t time on the x and N 
                                                 number of bacteria on the y. data = shows the data source
  geom_point() + #makes a scatter graph
  xlab("time") +
  ylab("bacterial abundance") +  #x/ylab are functions to add labels to the graog
 theme_bw()   #This graph plots the time on the x axis against the bacterial abundance over time, and the output is 
               a growth curve that platues out at the expected carrying capacity 6^10
 
 gplot(aes(t,N), data = growth_data) +
   geom_point() +
  xlab("time") +
  ylab("bacteria") +
  scale_y_continuous(trans='log10') # This graph also plots a semi graph for the data which can be used to work out initial population and carrying capacity
```

  # Now adding code for the final plot and model 

  Script to plot data and model
```
growth_data <- read.csv("experiment1.csv") #reading the data again
head(growth_data)

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
} #creating a function to get N(t) using previously calculated carrying capacity K and initial population N0, 

# got all numbers from the prev graph -carrying capacity

# Below I am creating tibbles for the new found datapoints, No, the initial carrying capacity, r, the growth rate and K the carrying capacity, as calculated by the previous equation

N0 <- exp(6.883) # the initial population size

r <-  1.004e-02  # the growth rate 

K <- 6.000e+10   # carrying capacity

ggplot(aes(t ,N ), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() 
scale_y_continuous(trans='log10')
sink(file = 'package-versions.txt')
sessionInfo()
sink()  # this graph is the same as the previous logistic curve graph, however the logustuic fun model which contains the Nt solution function has been added, which will give a line of best fit going through all the data points. This line will be red as signified in the geom function brackets

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

## (20 points) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage

![image](https://github.com/Oxstudent2/logistic_growth/assets/150162434/42dff07b-ad0d-4e5d-a242-e2fc5bc9311d)

Graph has also been uploaded into a file in this repository

code done on posit cloud hence 

```
growth_data <- read.csv("experiment1.csv")
head(growth_data)
growth_data

K <- 6.000e+10
r <- 0.01004
N0 <- 6.883
t <- growth_data$t
tx <- 4980

exponential_growth <- function(tx, N0, r) {
  return(N0*exp(r*t))
}
logistic_growth <- function(t, N0, r, K) {
  return(K/(1+((K-N0)/N0)*exp(-r*t)))
}

exponential_growth_population <- exponential_growth(tx, N0, r)
logistical_growth_population <- logistic_growth(growth_data$t, N0, r ,K)

logistic_growth_data <- data.frame(time = growth_data$t,
                                   population = logistical_growth_population)
exponential_growth_data <- data.frame(time = growth_data$t,
                                      population = exponential_growth_population)

combined_data <- merge(logistic_growth_data, exponential_growth_data, by = 'time')
head(combined_data)

library(dplyr)
library(gridExtra)

ggplot(combined_data, aes(x = time)) +
  geom_line(aes(y = population.x), colour = "blue", linetype = "solid", lwd = 1) +
  geom_line(aes(y = population.y), colour = "red", linetype = "dashed", lwd = 1) +
  labs(title = "Comparison of Exponential (Red) and Logistic Growth (Blue)",
       x = "Time (s)",
       y = "Population") +
  theme_bw()
```


The code below is extra code, as I was unsure if the logistic line was not working, so i compared the 2 graphs seperate and side by side with the same axis scale, and saw a similar result, so I was happy with the combined graph
```
ExpPLot <- ggplot(exponential_growth_data, aes(time, population))+
  geom_point()+
  theme_bw()

LogPLot <- ggplot(logistic_growth_data, aes(time, population))+
  geom_point()+
  theme_bw()+
  ylim(0, 4e+22)

grid.arrange(ExpPLot, LogPLot, ncol = 2)
```
The graph output is here
![image](https://github.com/Oxstudent2/logistic_growth/assets/150162434/74c81f04-01f2-4539-b79d-2cdd6f21ddb2)




