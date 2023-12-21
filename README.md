## 1) Analysis
In this experiment we are modelling population growth rate of _Esecheria coli_ in growth medium, with a specific interest in finding starting population size, carrying capacity and initial growth rate.
We used a logistic growth model for our data. Logistic growht can be described using a differential equation: dN/dT = Nr(1-N/K),
where N = current population size, r = instantaneous growth rate, K= carrying capacity of the system and t = time
SOlving this for population size at time t (N(t))in relation to the starting population size (N0), r and K gives us an equation we can use to plot a digital logistical growth curve:

N(t) = (K*N0*e^rt)/(K-N0+N0*e^rt)

When plotting, we see an initial exponential growth which slows down to reach equilibrium (when K is reached or N=K).



This **exponential** growth happens at the start when K is much greater than N (N=N0), and t is small.
simplifying our equation for this:

Nt = N0*e^rt

So we know that there is exponential growth at the start, when K>N0 and t is small
However, as t -> ∞, N(t) -> K. In other words, as time tends to infinity / time passes, the population size at that time conforms to K.

Using our first observation, that there is exponential growth at the start, we can estimate the values of K, N0 and r in our data (data from file: experiment1.csv). This was done using a linear approximation:

We know that, at this time point: 
                                  
                                  Nt= N0*e^rt
                                  
                              ->  ln(Nt) = ln(N0) + rtln(e) 
                              
                                         = ln(N0) + rt
                                         
This fits the same form as the equation of a straight line y = c + bx

**Finding estimates for N0, K and r**

**Using a linear model** 
>- code in fit_linear_model.R

    Linear model 1: K >> N0, t is small 
  
    results:
    
      N0 = exp(6.8941709) (intercept of the regression e^N0)
      
      r = 0.01 (gradient of the regression model)
      

  
    Linear model 2: N(t) = K, t is large
  
    results:
    
      K = 5.79e10 (intercept of the regression)

## **2) Calculating population size at t = 4980 min, assuming that the population grows exponentially**

Exponential growth equation (as calculated earlier): Nt = N0*e^rt

We already know N0, r and t, substituting these into our exponential function (exponential_fun from plot_data_and_model.R).

at t = 4980, Nt = 4.187604e+24

Subsistuting these into our logistic function instead (Using logistic_fun() from plot_data_and_model.R) this is the answer I got:

at t = 4980 Nt = 5.79e+10

### How do the logistic and exponential functions compare

Clearly, population size is far larger at t - 4980 when using an exponential function than a logistic function. This is likely because, at this time, the logistic curve would have already reached an equilibrium (we can see visually that this is reached by around t = 2000, run the two ggplot functions in plot_data_and_model.R), whilst the exponential growht curve does not do this and continues growing indefinitely.

This is likely a less accurate depiction of the true population size at t = 4980, as exponential growht only occurs at the very start of a biotic growth period, and then this tapers off, so the logistic function likely better describes the true population sizew at this later time.

## **3)**
[Link to plot](https://github.com/beckyroodt/logistic_growth/blob/dev/plot.png)

## **4) Brownian motion**

### Observations from random_walk:

* The data for each walk used the exact same code- each plot represents a random walk with 500 steps, starting from the origin.
* However each walk was different
    * (Therefore this data was not reproducible)
    * This is because the randomness in the steps results in different patterns for each random walk.
    * Due to the use of the "runif" function
* Both walks started at higher y-coordinates and ended farther down the graph with the passage of time
* Both walks were very tortuous with many turns, and looped back on themselves often-
    * this may be due to the relatively smaller step size of 0.25
* In essence, both walks appeared random

* The paths in each plot are colored based on the time steps, showing the progression of the walk.


## What is a random seed and how does it work?
### What it is:
* A random seed is an initial input given to a random number generator (RNG) algorithm so that it produces a random-appearing sequence of numbers
* If you use the same seed, the idea is that you will get the same sequence of random numbers with every run of the program
### How it works:
* Random number generators aren't entirely random
* They are deterministic, the initial state of the algorithm determines the sequence of numbers.
  * The alrogrithm produces sequences of numbers which mimic randomness.
* Setting the Seed:
  * This means initialising the intermal state of the RNG, the starting point for generating a sequence of seemingly random numbers.
* Seeds are very helpful for reproducibility.
* Setting a seed allows others to reproduce the same results
