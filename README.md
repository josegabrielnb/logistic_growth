# logistic_growth
# Assesment Write up Questions 1-3
## Question 1:
_Annotate the README.md file in your logistic growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used)_

### Introduction 

In this analysis, I looked at the population growth dynamics of an islolate of the bacterium _Escherichia coli_ suspended in growth media. I used the results from Experiment 1 (experiment1.csv) to calculate the initial population size, growth rate during the exponential phase and the carying capacity. 

This data provides the numeber of cells at 60 second intervals. In order to find the carrying capcaity, growth rate during the exponential phase or population size at a given time we can use the following differntial equation: 

<img width="133" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/76771622-53db-4f85-b931-47c9225f0fda">

When solved for N(t) this gives us 

<img width="161" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/10299ef9-8e3c-471c-9969-4ed1bf1cea3f">

### Analysis 
<ins>Calculating N0 and r</ins>

When t is small and K >> N0, the bacterial population grows exponentially, meaning that we can use the exponential growth phase to calculate N0 and r
* Since K is much greater than N0 and e<sup>rt</sup> is small, we can write K ∼ K − N0 + N0e<sup>rt</sup>.
* This means we can cancel from the original equation to make: 
  
  <img width="96" alt="Screenshot 2023-12-05 at 17 21 27" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/1d09f4a3-7782-40ed-810d-12be8939213b">
* This is put into its natural logaritmic form and ln(e) = 1
* So where the population is growing exponentially, the differntial equation is simplified to
  
  <img width="145" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/08149cbd-7156-4833-b88c-e739ef29435c">

* To find the region where the population is growing exponentually, I first plotted log(N(t)) against t, which allowed me to identify the region of exponential growth to be t<1500
* For this region of data, I created a lienar model of log(N(t)) ~ t
* This gave a intercept estimate of 6.8941709 meaning that the initial population size is e^6.8941709 so N0=987
* The gradient of the slope gives the population growth rate as per the simplified equation, so r=0.0100086

<ins>Calculating K</ins>

When t tends to infinity, N(t) tends to K, meaning that the size of the population remains constant at the carying capcaity. 
* Therefore we can calculate K using the region where curve has flattened (and the population is no longer growing)
* Using the plot of log(N(t)) against t, I identified the region where the curve had flattened to be t>4000
* For this region of data I created a linear model with a constant N
* This gave K=60000000000
 
### Results 
N0=987

r=0.0100086

k=60000000000

## Question 2 
_Use your estimates of N0 and r to calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?_

When t=4980 min
* N(4980) = 6x10<sup>10</sup> using the logistic fucnction
  * This uses the original differntial equation

    <img width="161" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/adbeea9b-e48b-4483-8b9d-467a2c693d93">

* N(4980) = 4.370813x10<sup>24</sup> using the exponential equation
  * This uses the exponentual function

    <img width="97" alt="image" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/b0695f16-72c5-4554-bb32-cded0b60012b">

The population size predicted under logistic growth is much smaller than the population size predicted under the exponential growth model. This is becase the t=4980 occurs after the population has reached its carying capcaity so the population is no longer growing exponentually.

## Question 3 
_Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage_

<img width="1428" alt="Screenshot 2023-12-05 at 21 53 02" src="https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/assets/150151352/8effcf19-6be5-4bf2-9983-c10720e2ff36">

The code to create the graph has been uploaded to the repository under the title plot_logistic_and_exponential.R 
The graph png has been uploaded under the title logistic_and_exponential_comparison 



