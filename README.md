# logistic_growth
R scripts for reproducible analysis of logistic growth for a comp class.
1.2 Assignment questions:

1)
In this analysis, we took bacterial growth data which contained cell number against time and modelled it in a density-dependent model.
This data showed a signature exponential growth phase until they approached the carrying capacity of the medium causing growth to slow down and then halt.
To extract the stages we transformed the y-axis (number of cells) by taking the log to show the exponential nature in a linear format.
We broke up the transformed data into these 2 stages and marked them based on time, I treated everything under 300 mins to be exponential and everything over 1000 to be completely stationary.
By putting the data from these 2 stages into linear models we can extract the intercept and gradients of both.

Exponential phase:
Intercept = 7.5651870
Gradient = 0.0301927
The intercept in this case refers to ln(N0) so we do the inverse e^7.5651870 to get an N0 of 1929.83 
The gradient is r so it remains as 0.0301927
The stationary phase has a gradient of 0... as stationary and an intercept of 1x10^9 which represents k.
We then used these to create a model which fits the data quite well and uses the logistic formula
N=(N0*K*exp(r*t))/(K-N0+N0*exp(r*t)) which follows density dependence as dictated by the limit k

2)
If you assume that the population is growing exponentially then we can ignore density dependence and use the formula
N=N0*e^rt
N=1929.83 * e^(0.0301927 * 4980)
N=3.8537507e+68 at t=4980
compared with the 1x10^9 under the logistic model this is alot larger.

3










