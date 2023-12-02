#Script to estimate the model parameters using a linear approximation (fitting the linear models)

#install.packages("dplyr")
library(dplyr)
#file.choose()
growth_data <- read.csv("/cloud/project/experiment1.csv") #This step is getting us to paste the directory for the data file we have downloaded

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N)) 
#We are choosing our value for t. 
#We have chosen 1000 as our value for t, as this is a small value, still in the exponential part of the graph. 
#Note: there is not data for values as small as 50.

model1 <- lm(N_log ~ t, data_subset1) #The bracket part of the code is asking R for a slope and intercept. t is x axis, and N_log is y axis.
summary(model1)

#This is a model being applied to the exponential part of the graph, which is why we want to choose a small value of t.
#Intercept = 6.883 and gradient 0.001004. The intercept of this model is N0 (initial pop size) and gradient is r (rate of change in population size).
#This is just a model to find the intercept and gradient of the log graph. We can use these values for plotting the data in plot_data_and_model.

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3180) 
#Choose a t where the data has already reached carrying capacity. 
#Choose a number about halfway into the numbers which have the final carrying capacity number as the population size at that time.

model2 <- lm(N ~ 1, data_subset2) 
#We don't need a slope, we need an intercept. This will be a horizontal line, so we don't input an x axis, we just make it 1.
summary(model2)

#This is just a model to find what the intercept at the carrying capacity is. Ie. what the carrying capacity is.
#Carrying capacity is around 60,000,000,000 (shown in the (Intercept) section of the outputted model)


