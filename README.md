# logistic_growth
# Assesment Write up Questions 1-3
## Question 1:
_Annotate the README.md file in your logistic growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used)_

#### Introduction 
In this analysis, I looked at the population growth dynamics of an islolate of the bacterium _Escherichia coli_ suspended in growth media. I used ther results from Experiment 1 in order to calculate the initial population size, growth rate during the exponential phase and the carying capacity. 

This data provides the numeber of cells at 60 second intervals. In order to find the cary capcaity, growth rate during the exponential phase or population size at a given time we can use the following differntial equation: 

<img width="161" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/10299ef9-8e3c-471c-9969-4ed1bf1cea3f">





First, I plot the growth data and a semilog plot of the growth data (with number of cells on the y axis as log values). 

The linear part of the semilog plot describes the exponential growth phase. Therefore we can use this 



* Purpose of the Anaylsis
* Which data did I use 

#### Analysis 
* Maths section 

#### Results 
* Estimates for N0, r and K

## Question 2 
_Use your estimates of N0 and r to calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?_

When t=4980 min
* N(4980) =   using the logistic fucnction
* N(4980) =   using the exponential equation 

Calculations for this: 
Use the logistic function 
Approximate the exponential 

The population size predicted under logistic growth is... 
This is the same/differnt to the population size calculted using the estimates of N0 and r 
I think it will be differnt - this time is after it has reached the carying capacity and we are using the growth rate for the exponential growth phase 
Which is not true at t=4980 as here r=0

## Question 3 
_Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage_

I have aded an R script to the repostory that makes a graph comparing the exponential and logistic growht curves. This script has been called exponential_logistic_comparison.r
