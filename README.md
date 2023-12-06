**Question 1**  

*Analysis Overview:*  
The analysis experiment1.csv is concerned with 900 ul of growth media, and an isolate of the bacterium Escherichia coli, that is suspended in 100 ul of the same media. The aim is to estimate the initial population size (*N<sub>0</sub>*), rate of growth (*r*) and carrying capacity (*K*) as well as to model the population growth in this system. Overall, the analysis should be reproducible and the data should be available for others to replicate.  
To obtain *N<sub>0</sub>*, *r* and *K*, we make the following observations:
  1. when *K* is much greater than *N<sub>0</sub>* and *t* (time) is small, the population grows exponentially
  2. when *t* tends to infinity, the population size is equal to the carrying capacity  

These observations help estimate the values from the experiment1.csv data set, using linear approximation (*y = b + mx*) and the coefficient values from the linear model table. We can restrict ourselves to a region showing exponential growth (*N(t) = N<sub>0</sub>e<sup>rt</sup>*), whereby *N<sub>0</sub>* is the inverse of *b* (intercept), *r* is the gradient and *K* is where the population line becomes horizontal, reaching its capacity.  

*Results*  
The estimates are as follows:
- *N<sub>0</sub>* = 1330.74 
- *r* = 0.0095218
- *K* = 6 x 10<sup>10</sup>

**Question 2**

Using the exponential growth model, *N(t) = N<sub>0</sub>e<sup>rt</sup>*, we can substitute for *N<sub>0</sub>* and *r* using the estimates, to find the population size when *t* = 4980 min. This gives the equation:  

  *N(4980) = 1330.74e<sup>0.0095218 x 4980</sup> = 5.220522 x 10<sup>23</sup>*  
  
*How does it compare to the pop size predicted under logistic growth?*
It is much larger compared to the population size under logistic growth which at *t* = 4980, reaches *K* (6 x 10<sup>10</sup>).  
There is no carrying capacity in exponential growth to limit population growth; the population can theoretically continue to grow indefinitely and predicts continuous, unrestricted growth.  
Yet under logistic growth, the population is limited by its carrying capacity, the maximum population that the environment can sustain. As the population approached *K*, its growth rate slowed down, reaching an equilibrium.  

**Question 3**

