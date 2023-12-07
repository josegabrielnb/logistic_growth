 # Reproducible Research: version control and R Homework answers  
1. I wanted to estimate the initial population size (N0), the growth rate (r), and the carrying capacity (K) of the population of bacteria in experiment 3. First, by plotting the data in a log plot I could visualise the growth of the bacteria over time. Then, by transforming the y-axis, I was able to create a semi-log plot. Using the semi-log plot, I was able to obtain values of t to use for fitting the growth to two linear models (t<2500 for the exponential growth and t>4000 for the plateau). I was able to obtain estimates for r (using the gradient of the first model) and K (using the intercept of the second model). I used the N value at t = 0 for N0. 
N0 = 4879 , r = 4.964e-03, K = 4.998e+09

2. N0 = 4879, r = 4.964e-03, t = 4890
  ###### N = N0*exp(r*t)
  ###### N = 4879*exp^(4.964e-03*4980)
  ###### N = 57801
  ###### This value is higher than what is expected from the logistic growth model. It is above the carrying capacity of the population.

3. ![image](https://github.com/beecabbages/logistic_growth/assets/150164163/6a5dfcd6-16f9-4a93-a7f7-99507dea2d35)
The code for this graph can be found in the repo (comparing_logistic_and_exponential.R)


   
