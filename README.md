# Question 1

## Analysis
File used: experiment1.csv

In the ‘plot_data.R’ file, the code loads the raw data, saves it under the name ‘growth_data’, and then creates a scatter plot showing this data. Next, it creates another scatter plot in which the y-axis values have been log transformed so that there are two linear sections. This allows the use of two linear models to estimate the values of N0, r and K. These linear models are created in the ‘fit_linear_model.R file’. In case 1, K >> N0 and t is small. I chose to filter values of t < 1000 because these were appropriate for this linear model. In case 2,  N(t) = K. Filtering values of t > 3000 was appropriate for this model.

## Results:
File used: experiment1.csv

From the two linear models, I was able to obtain the following estimates:

* Initial population size (N0) = exp(6.883) = 975.55

* Carrying capacity (K) = 6e + 10 = 60,000,000,000

* Growth rate (r) = 0.01004


# Question 2
t = 4980 min

To calculate the population size at t = 4980 min, assuming that the population grows exponentially, I used the equation: N(t) = N0 * exp(r * t) and plugged in my estimated values of N0 and r. 

Answer: 

N = 5.053888e+24 

Under logistic growth, the population size at 4980 min is equal to the carrying capacity (60,000,000,000) whereas under exponential growth, the population size at this time is equal to 5.053888e+24. The estimated value for the population size under exponential growth is much larger because with this model there are unlimited resources and no density-dependent factors to limit population growth as the population size increases. With logistic growth, there are limited resources and a carrying capacity (the maximum population size that can be sustained by the environment) meaning that population size is capped at a certain limit. 

# Question 3

* The R script for the graph comparing the exponential and logistic growth curves can be found in this repository under the name 'exponential_vs_logistic.R'
* The pdf containing the image of the graph as a vector can also be found in this repository under the name 'exponential_vs_logistic_figure.png'


![image](https://github.com/StarfishOx/logistic_growth/assets/150164123/43b01c6d-988b-411e-9601-aa3346761376)


