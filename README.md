# logistic_growth
This README file answers questions 1, 2, and 3 of the reproducible research homework. Please refer to the individual R scripts linked for each part for complete code annotations. 

#1 I used csv #2 for this analysis.

First, refer to plot_data.R, where I have annotated my individual steps - https://github.com/audickinson/logistic_growth/blob/main/plot_data.R 

In the first graph I create, showing time on the x axis and population size on the y axis, it is clear that growth follows a logistic pattern. Population size increases exponentially at first, then levels off at a carrying capacity. 

![5e112742-fe03-4387-af65-19a004dc1f67](https://github.com/audickinson/logistic_growth/assets/150164051/2c1b0a5f-8c32-459d-9a53-7cef2fd292fa)


In the next graph, the same data is shown, but this time on a log scale. 
![ab40309e-3c91-4d3a-8849-c1c193f72491](https://github.com/audickinson/logistic_growth/assets/150164051/1d97d753-c774-4b5a-9452-4f5e43ebeb6c)

Next, move on to fit_linear_model.r -- https://github.com/audickinson/logistic_growth/blob/main/fit_linear_model.R

First, I fit separate linear models for the exponential and level (carrying capacity) portions of the graph. To isolate initial population growth, I only use the first two data points at t = 0 and t = 60. To measure population size at carrying capacity, I only use data points where N is well past its growth stage - over 1000, for example. 

I use the summary() function to find the slope and intercept of each of these linear models, which are important parameters in the final script. 

Next, move on to plot_data_and_model.R -- https://github.com/audickinson/logistic_growth/blob/main/plot_data_and_model.R

First, I define a function that replicates the structure of the basic logistic growth equation such that, when the parameters N0, K, and r are defined, the input of a given time value will yield the population size at that time. 

I take the values of N0, r, and K from (see scripts for explanations how) from the parameters output from the linear models in fit_linear_model.r . 

I make a graph with the model, using these three data points, plotted in red on top of the original data points, and it appears to fit extraordinarily well, confirming the accuracy of the parameters derived from the linear model. 
![79c9636e-fce9-43e2-8b39-0b2dcda7a7ce](https://github.com/audickinson/logistic_growth/assets/150164051/40041cd2-5c81-4e0c-aabc-d77a370ccb34)


# Results
In this exercise, I found the values of key population parameters of a given sample of cells. From the results of linear models, and confirmed by the fit of the logistic growth function with the following parameters, I can discern that N0 = 2000, r = 0.03, and K = 1*10^9. In this context, this means that the initial population size in the model is 2000, the growth rate is 3%, and the final population size is 9 billion cells. 

