# Assignment questions
## Question 1

This analysis was conducted using the data from the experiment1.csv file. The analysis investigated the dynamics of population growth over time of a culture of _Escherichia coli_, with the starting conditions being 100 ul of an isolate of the bacterium suspended in growth medium plus 900 ul of just growth medium, to create a 1 ml solution. 

The data:

```{r}
growth_data <- read.csv("experiment1.csv")
```

In the R file "plot_data.R", I constructed two initial plots of the data - consisting of values of N (population size) for each value of t (time) - without a fitted model, using the package ggplot2. On one of these plots the y-axis (population size) was log-transformed. The code used to construct the plot of the untransformed data was:

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

It is evident from the plots that the population exhibits logistic growth, with an initial period of exponential growth while the population size is small relative to the carrying capacity and resources are abundant. However, when the population becomes larger and the resources scarcer, the rate of growth decreases and the population plateaus at the carrying capacity. In the R file "fit_linear_model.R" I combine what I can see from these plots with the differential equation (1) which relates N at time t with the starting N (N0), the growth rate (r) and the carrying capacity (K) to estimate the parameters of a model which represents the growth of the population. 

We already know N0 by visual inspecting the data. At time t, N = 879, which is N0. 

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

To summarise until this point, the data provide us with N0, and the models provide us with estimates of r (1.004e-02) and K (6.000e+10).

