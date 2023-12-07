# logistic_growth
Modelling exponential and logistic growth in a reproducable manner using RStudio, Posit, and GitHub 

**Question 1:**

For all analysis and figures produced, "experiment1.csv" was the file used

Upon first analysis and visualisation of the data using the ggplot function, it is shown that the population size over time appears to follow a sigmoidal pattern, having an initial period of exponential growth starting from a very small starting population, and then changing to equilibrium behaviour approaching an asymptote of 6e+10 cells. This sort of behaviour is consistent with a logistic growth curve, and this is the model we will try to utilise.

To test whether this is indeed a logistic curve, we need to create logarithmic scale on the y-axis, thus making a semilog plot, and if there is first a period of exponential (seen as linear on a semilog plot) growth followed by a flattening out at an asymptote, this is consistent with the prediction that we are working with a logistic growth curve. Indeed, this is what we observe.

Next, we need to generate 

---------------------------------------

**Question 2:**

If we are assuming exponential growth, then we can use the formula N(t) = N0e^(rt), with N0 = 972.6, and r = 0.01. For the predicted population size at t = 4980 min, we can simply plug t = 4980 into the formula, giving us N(4980) = 972.6e^(0.01*4980) = 4.13e+24 cells.

Now, this seems like a massive number of bacterial cells, so if we were to instead use the logistic model which we have defined in our R script to predict the population size, plugging t = 4980 into the function yields a population size of 6e+10 cells.

As we can see here, using a logistic model here produces a predicted population size nearly 14 orders of magnitude smaller than if a pure exponential model were used.

--------------------------------------

**Question 3:**

Shown below is the graphical comparison between the exponential model (blue) and the logistic model (red) using the estimated parameters for N0, r, and K.

![image](https://github.com/danieldshapiro/logistic_growth/assets/150149671/42f8c5d6-5172-4505-92cd-bae7fed20398)

