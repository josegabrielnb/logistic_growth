# logistic_growth
Modelling exponential and logistic growth in a reproducable manner using RStudio, Posit, and GitHub 

**Question 1:**

For all analysis and figures produced, "experiment1.csv" was the file used

Upon first analysis and visualisation of the data using the ggplot function, it is shown that the population size over time appears to follow a sigmoidal pattern, having an initial period of exponential growth starting from a very small starting population, and then changing to equilibrium behaviour approaching an asymptote of 6e+10 cells. This sort of behaviour is consistent with a logistic growth curve, and this is the model we will try to utilise.

To test whether this is indeed a logistic curve, we need to create logarithmic scale on the y-axis, thus making a semilog plot, and if there is first a period of exponential (seen as linear on a semilog plot) growth followed by a flattening out at an asymptote, this is consistent with the prediction that we are working with a logistic growth curve. Indeed, this is what we observe.

Next, we need to generate a formula to model the observed behaviour using the logistic model, but there are several constants which we need to find to create a correctly fitted model. These constants are N0 (the initial cell number), r (the growth rate constant), and K (the carrying capacity). To go about calculating these constants we must use several different aspects of the data. Firstly, to determine the starting cell number N0 and the growth rate, we need to look specifically at the section of the data which displays exponential growth - in this case a conservative estimate of datapoints t<1000. Plotting this section of the data on a semilog plot with N being logarithmically transformed gives us a linear plot. From this we can do a linear regression, and use the data from this to define N0 and r. The summary of this linear regression is as shown below:

![image](https://github.com/shad210/logistic_growth/assets/150149671/c56a80fd-339f-482f-a3bc-c1e69eaa5267)

The two values of our primary interest here are the estimate values. The intercept value is the logarithim of the initial cell number (remember that we have carried out a logarithmic transformation on N in this model). So, to get N0, we simply need to calculate N0 = e^(6.88) = 972.6 cells (since this is a model, non-whole cell numbers are acceptable to use as it is just an estimate). To get the value for the growth rate r, we simply needs to look at the estimate for t, which is 0.01, thus r = 0.01.

To find the value for the carrying capacity constant, we need to look at the subset of the data which displays asymptotic behaviour. In this case, we looked specifically at the section of datapoints where t>3000. We can plot this data and generate a linear regression, and use this to define the carrying capacity (K). The summary of this linear regression is shown below:

![image](https://github.com/shad210/logistic_growth/assets/150149671/b2ae7be8-9898-43f2-9263-928e1683294c)

From here, we can use the single intercept estimate to get our value for K, and K = 6e+10 cells.

In conclusion, our estimates for N0, r, and K are:

N0 = 972.6 cells

r = 0.01 cells/min

K = 6e+10 cells

---------------------------------------

**Question 2:**

If we are assuming exponential growth, then we can use the formula N(t) = N0e^(rt), with N0 = 972.6, and r = 0.01. For the predicted population size at t = 4980 min, we can simply plug t = 4980 into the formula, giving us N(4980) = 972.6e^(0.01*4980) = 4.13e+24 cells.

Now, this seems like a massive number of bacterial cells, so if we were to instead use the logistic model which we have defined in our R script to predict the population size, plugging t = 4980 into the function yields a population size of 6e+10 cells.

As we can see here, using a logistic model here produces a predicted population size nearly 14 orders of magnitude smaller than if a pure exponential model were used.

--------------------------------------

**Question 3:**

Shown below is the graphical comparison between the exponential model (blue) and the logistic model (red) using the estimated parameters for N0, r, and K.

![image](https://github.com/danieldshapiro/logistic_growth/assets/150149671/42f8c5d6-5172-4505-92cd-bae7fed20398)

