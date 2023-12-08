#Script to estimate the model parameters using a linear approximation
install.packages("dplyr")
install.packages("crayon")
install.packages("patchwork")
library(dplyr)
# This code calls the data from our data set
growth_data <- read.csv("experiment1.csv")
# 
# We start with the case where  K >> N0 and  t is small
# this gives us an instance where 


# This code creates a new data set from our original one.
# it only considers data for when t < 300 and changes N values to Log(N) values
data_subset1 <- growth_data %>% filter(t<300) %>% mutate(N_log = log(N))
data_subset1
# calling on data from the new data set to make a ggplot
ggplot(aes(t,N_log), data = data_subset1) +
  # xlab and ylab decide the axis label
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  # this code gives the black and white background
  theme_bw()






# Looking at times where K is greater than starting N values
# We are also transforming N values to log(N) values



#plot(N_log ~ t, data= data_subset1)

#add fitted regression line to scatterplot
model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 6.8421256  0.0495744  138.02 8.39e-07 ***
#  t           0.0103516  0.0003373   30.69 7.60e-05 ***

# So model 1 is drawing conclusions based on when t is small and being plotted against log(N)


#Model 1 is saying that when t is small, 
#the y intercept is 6.8421256 which must be our ln(N0)
#the gradient is 0.013516 which must be our growth rate or r 





#Case 2. N(t) = K
# Looking at cases where we are at carrying capaicty 
# when N(t ) = K we can determine K by creating a mapping our data to a linear function where y is a constant
data_subset2 <- growth_data %>% filter(t>3000)

model2 <- lm(N ~ 1, data_subset2)
#lm(N~1) means that N is not being predicted by an independent variable.
#This means that the model is returning the mean of N


summary(model2)
model2

#Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 6.000e+10  6.446e+03 9307484   <2e-16 ***

# Here summary is telling us that when 1 is large and therefore
#not changing in accordace with r that our intercept is equal to k
#here k = 6e^10

