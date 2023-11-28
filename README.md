# Assignment questions
## Question 1

This analysis was conducted using the data from the experiment1.csv file. The analysis investigated the dynamics of population growth over time of a culture of _Escherichia coli_, with the starting conditions being 100 ul of an isolate of the bacterium suspended in growth medium plus 900 ul of just growth medium, to create a 1 ml solution. 

The data:

```{r}
growth_data <- read.csv("experiment1.csv")
```

In the R file "plot_data.R", I constructed two initial plots of the data - consisting of values of N (population size) for each value of t (time, minutes) - without a fitted model, using the package ggplot2. On one of these plots the y-axis (population size) was log-transformed. The code used to construct the plot of the untransformed data was:

```{r}
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()
```

And the code used to construct the plot of the data with the log-transformed values for N was:

```{r}
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
```

These plots are shown below:

_A plot relating the population size (N) with time (t)_
<img width="1000" alt="Screenshot 2023-11-28 at 11 08 41" src="https://github.com/jamesimcculloch/logistic_growth/assets/150149794/02758da6-2eb1-4780-96f1-9a06590a4b51">

_A plot relating the log of the population size (N) with time (t)_
<img width="999" alt="Screenshot 2023-11-28 at 11 10 00" src="https://github.com/jamesimcculloch/logistic_growth/assets/150149794/e98d3620-1eec-4c7d-9183-371bbedd7cfb">


It is evident from the plots that the population exhibits logistic growth, with an initial period of exponential growth while the population size is small relative to the carrying capacity and resources are abundant. However, when the population becomes larger and the resources scarcer, the rate of growth decreases and the population plateaus at the carrying capacity. In the R file "fit_linear_model.R" I combine what I can see from these plots with the differential equation (1) which relates N at time t with the starting N (N<sub>0</sub>), the growth rate (r) and the carrying capacity (K) to estimate the parameters of a model which represents the growth of the population. 

We already know N<sub>0</sub> by visual inspecting the data. At time t, N = 879, which is N<sub>0</sub>. 

We can estimate the growth rate, r, by isolating the part of the growth curve which is exponential:

```{r}
library(dplyr)
data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N))
```

This subset data only includes values of N at times t < 1000. This was determined by visual inspection of the two exploratory plots; the population is still in the exponential phase at t = 1000. This data subset also includes log-transformed values of N as opposed to untransformed N. This data subset was then used to construct the following linear model:

```{r}
model1 <- lm(N_log ~ t, data_subset1)
```
The summary output of this model appears as below:

```{r}
Call:
lm(formula = N_log ~ t, data = data_subset1)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.104226 -0.006385  0.002421  0.009861  0.052574 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 6.883e+00  1.548e-02   444.8   <2e-16 ***
t           1.004e-02  2.749e-05   365.1   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.03332 on 15 degrees of freedom
Multiple R-squared:  0.9999,	Adjusted R-squared:  0.9999 
F-statistic: 1.333e+05 on 1 and 15 DF,  p-value: < 2.2e-16
```
The key element of this output is the "Estimate" for t in the coefficients, which is 1.004e-02. This represents the slope of the model, equivalent to an estimate of r (the growth rate). 

We can then estimate K, the carrying capacity, by isolating the part of the curve representing when the population has reached this carrying capacity (the plateau):

```{r}
data_subset2 <- growth_data %>% filter(t>3000)
```
We choose values of N corresponding to values of t above 3000 because beyond this point the population has reached its carrying capacity plateau, as determined by visual examination of the exploratory graphs. This data subset was used to construct the following model:

```{r}
model2 <- lm(N ~ 1, data_subset2)
```

The summary output of which appears as below:

```{r}
Call:
lm(formula = N ~ 1, data = data_subset2)

Residuals:
    Min      1Q  Median      3Q     Max 
-172530   10771   12331   12393   12615 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 6.000e+10  6.446e+03 9307484   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 37030 on 32 degrees of freedom
```
The estimate for the intercept represents the carrying capacity (K), which is 6.000e+10.

To summarise until this point, the data provide us with N<sub>0</sub>, and the models provide us with estimates of r (1.004e-02) and K (6.000e+10).

These estimates allowed the parameterisation of the following model, representing the solution to the differential equation describing logistic growth:

```{r}
N0 <- 879
r <- 1.004e-02
K <- 6.000e+10

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
```

This model allows us to predict N with any value of t. The model was plotted using this code:

```{r}
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  scale_y_continuous(trans='log10')
```

The plot is shown below, with the red line representing the model fit, and N log-transformed:

<img width="1002" alt="Screenshot 2023-11-28 at 11 36 40" src="https://github.com/jamesimcculloch/logistic_growth/assets/150149794/e228eb57-a17b-4727-a2e3-f1d6e37ea09d">


## Question 2

Assuming that the population size is still growing exponentially at at t = 4980 minutes, we can disregard K and assume that t is small. That means that the solution to the differential equation describing the logistic growth looks like this:

N(t) = N<sub>0</sub>e<sup>rt</sup>

Therefore N at t = 4980 can be calculated like this:

```{r}
N0 <- 879
r <- 1.004e-02
t <- 4980
N <- N0*exp(r*t)
N
```

This provides the following output:

```{r}
4.553712e+24
```

This is considerably larger than the predicted population size at t = 4980 under logistic growth, which would be the carrying capacity (K) given that the exponential phase would have ended. Under logistic growth, N when t = 4980 is 6.000e+10. For the population to reach the much larger estimated size of 4.553712e+24, the carrying capacity would have to be much greater, necessitating a greater abundance of resources present within the culture. 

## Question 3

The file Question3.R contains code used to create a graph comparing the exponential and logistic growth curves, using the parameter estimates found earlier. The graph product is shown below, and in the file Question3_graph.png.

<img width="605" alt="Question3_graph" src="https://github.com/jamesimcculloch/logistic_growth/assets/150149794/84c97b6c-b891-48d0-bc5c-fd5e5e96cf33">

I will also run through the code used to create this graph here. First of all, the parameter estimates needed to be assigned:

```{r}
N0 <- 879 #Starting N

r <- 1.004e-02 #Growth rate

K <- 6e+10 #Carrying capacity
```

The logistic function was then created, which is based on the solution to the differential equation describing logistic growth. It returns N for any t:

```{r}
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}
```

The same was then done for the exponential function. This was created also based on the same differential equation solution, but assuming that K is never reached. As K is infinite if the population grows exponentially indefinitely, it dominates the denominator of the equation, allowing the following approximation:

K ~ K - N<sub>0</sub> + N<sub>0</sub>e<sup>rt</sup>

This leaves only K as the denominator. The K in the numerator and that in the denominator can then cancel, leaving the following equation as the exponential function:

```{r}
exponential_fun <- function(t) {
  
  N <- (N0*exp(r*t))
  
  return(N)
}
```

This allowed a graph incorporating these two functions to be plotted as so:

```{r}
ggplot(data.frame(x = c(10, -10)), aes = (x = x)) +
  geom_function(fun = logistic_fun, colour = "red") +
  geom_function(fun = exponential_fun, colour = "blue") +
  xlim(0, 5000) +
  scale_y_continuous(trans = "log10") +
  xlab("t (minutes)") +
  ylab("log(N)") +
  ggtitle("A comparison of logistic and exponential growth curves using 
          parameter estimates from our culture of E. coli") +
  geom_point(aes(x=x, y = -1, color = "Exponential")) +
  geom_point(aes(x=x, y = -2, color = "Logistic")) + 
  scale_color_manual(values = c("Logistic" = "red", "Exponential" = "blue"),
                     name = "Growth curve")
```
There are a few aspects of this code necessary to explain. The first line establishes an empty dataframe to allow the functions to be plotted on the graph without any data. The two geom_point() functions create two points which are red and blue to act as 'dummy data' to allow the creation of a legend. It does not appear to be possible to create a legend without any data plotted on the graph, necessitating the inclusion of these 'dummy data'. They were plotted with negative y values to make sure they do not appear on the graph (they do not appear on the graph because the y values are log-transformed, and it is not possible to take the log of a negative number). The dummy data were then used to create the legend using the scale_color_manual() function. 
