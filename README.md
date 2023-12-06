
**Aim**

The aim of this analysis was to estimate the starting population size, growth rate, carrying capacity, and create a logistical model, for a population growth of _E. coli_ bacteria suspended in 1ml of growth medium based on the experimental data which can be found in experiment3.csv. 

**Linear models**

We started our analysis by plotting semilog-plot of the growth data by log-transforming the y axis (No. of cells), whilst keeping the x axis  (time) linear. This semilog-plot can be divided into two distinct linear phases- the growth phase where _ln(N) = ln(N0) + rt_ and the constant phase where _N(t) = K + 0 · t_. We created a linear model for each phase and used them to estimate starting population size (_N0_), growth rate (_r_) and carrying capacity (_K_):

model1 (population growth phase):

_N0 _= exp(8.542e+00)- exponential of the intercept of model1

_r_ = 4.964e-03- gradient from model1

model2 (constant phase):

_K_ =  4.882e+09- intercept of model2

**Logistical growth model**

These estimated values where then inserted into the following model of logistical growth:

_N = (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))_

Q2. The predicted value for N at t-4980, when the estimated values for N0 and r are inserted into into the exponential growth model N0*exp(r*t) is 2.791359e+14, this is much higher than the value at t = 4980 under the logistic growth model, 4.882e+09. This is due to the fact that at this timestep the logistic model has reached the constant phase, where N remains equal to the carrying capacity. Without this constraint under the exponential model, N is free to continue growing.

Q2. 
<img width="595" alt="Screen Shot 2023-12-06 at 6 49 12 PM" src="https://github.com/Echidna03/logistic_growth/assets/114155443/e2a1bb28-9c62-4143-84cd-9c37c9d271dc">
