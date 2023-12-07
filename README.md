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
