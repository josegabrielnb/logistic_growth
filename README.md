# Logistic growth

### Assignment questions

### Question 1 : analysis of data

This repository analyses the logistic growth of Escherichia coli (*E.
coli*) in a test tube, looking at the number of cells produced every
hour. *E. coli* will initially grow rapidly due to large amount of
resources available, until eventually decreasing in growth rate. Growth
rate will decrease as resources are depleted, until eventually the
bacterial population size remains constant as the population reaches its
maximum capacity. This maximum capacity is known as its carrying
capacity. The carrying capacity is a species' maximum population size in
a particular habitat given the number of resources available. In this
analysis, we are interested in finding out what the carrying capacity of
the bacterial population is, denoted by '*K*.' We are also interested in
finding the initial population size of the *E.coli* population, 'N~0~',
and growth rate, '*r*'. Obtaining the values of these three parameters
is important, as it allows us to find out the number of bacterial cells
at any given time point, t (mins). This can be done using the logistic
growth equation below :

N(t) = (*K* N~0~ e^(rt)^) / (*K*-N~0~+(N~0~e^(rt)^))

This logistic growth equation can be graphically represented as a
sigmoidal model, in which the population will appear to grow
exponentially at the beginning, and then slows down upon reaching a
constant (equilibrium). By log transforming the y-axis data (number of
*E. coli* cells), two linear approximations can be produced to the
sigmoidal model, and produce fit two linear models to the data, from
which N0, K, and r can be obtained.

The first linear approximation fits a linear model to the data at
earlier time points to estimate values of N~0~ and t. This is because it
is observed that when K is much larger than N~0~, and t is small, the
population will grow exponentially. Therefore, to estimate values of
N~0~ and t, the linear approximation must restrict itself to a region in
the linear model that shows exponential growth. So the linear
approximation for this would be :

ln(N) = ln(N~0~) + *r*t

in which N~0~ is the intercept of the linear regression, and r is the
gradient.

The second linear approximation fits a linear model to the data at later
time points to estimate the value of K. This is because it is observed
that when 't' is large, and the population size remains constant, K will
equal N(t), so the following approximation can be used to estimate K :

N(t) = *K* + (0 * t)

The linear regression during this point is flat, with a gradient of 0.

### Q1 results

Growth data was obtained by loading "experiment1.csv" from the GIThub
"logistic_growth" repository. To estimate N~0~ and t, the growth data
was be subset before the point of constant growth (the carrying capacity
of the E. coli population) when t is small. This was done with the
following code :

data_subset1 \<- growth_data %\>% filter(t\<1600) %\>% mutate(N_log =
log(N))

A linear model was then applied to the "data_subset1" as follows :

Model1 \<- lm(N_log \~ t, data_subset1)

In the output of this linear model, an estimate of the intercept was
found to be 6.903e+00. As the data was logged prior to applying the
linear model, calculating e^6.903e+00^ provides an estimate for N~0~ =
995.256 (\~995 cells). An estimate for *r* was also obtained from the
output of this linear model from the estimate of t. From this, an
estimate of r = 9.990e^-03^ (cells/min) was found.

To estimate the value of *K*, the growth data was subset to where the
gradient was 0, and no more growth occurred (N=*K*) and t is large. This
was done with the following code :

data_subset2 \<- growth_data %\>% filter(t\>2400)

A linear model was then applied to the "data_subset2" as follows :

Model2 \<- lm(N \~ 1, data_subset2)

The estimate of *K* was obtained from the estimate of the intercept
output. An estimate was found of K=6.000e+10.

A summary of the parameter values can be found below.

-   N~0~ \<- 995.256 - this is obtained from output of model 1, in which
    you do e to the power of the estimate of intercept to get N0 -
    exp(6.903e+00)

-   *r* \<- 9.990e-03 - this is the output from model 1, it is shown as
    estimate of t in the output of the linear model

-   *K* \<- 6.000e+10 - this value is obtained from model 2 estimate.
    This model has not been logged, therefore, no need to use an
    exponential function to obtain this estimate.

### Question 2 : comparing logistic and exponential population growth

Assuming the population size grows exponentially, we can use the
equation :

N(t) = N0e^rt^

to calculate the population size at t = 4980 minutes. This can be
calculated as follows.

-   N0 \<- 995.256

-   r \<- 9.990e^-03^

-   t \<- 4980

-   N(t) = N0e\^rt

-   N(4980) = (995.256) \* e^((9.990e-03)\*4980)^

-   N(4980) = 4.019501e^24^ *E. coli* cells = \~4e^24^ *E. coli* cells

Under the logistic growth model, at 4980 minutes the population has
reached its carrying capacity, so N=K at this time point. Therefore,
population size at t = 4980 minutes under the logistic growth model is N
= 6.000e^10^ *E. coli* cells (obtained from question 1 analysis).

When comparing the two values, *E. coli* population size at t = 4980
minutes is higher under the exponential growth model (\~4e\^24 cells \>
= 6.000e\^10 cells). This is because the exponential growth model does
not take into account density dependence of the *E. coli* populations in
regards to resources available, such as space available for growth or
nutrient availability, hence there is no carrying capacity.
Consequently, the population will have the same positive growth rate
regardless of population size for the entirety of the time period we
allow for the model to continue.

The logistic growth model, however, has a carrying capacity, and takes
into account diminishing resources as the *E. coli* population
increases. Therefore, as time continues, the number of cells in the
bacterial population is limited as the population grows, until growth
becomes constant, and no more bacterial cells can be supported in the
environment (*K* is reached). Ultimately, the logistic growth model is
more realistic than the exponential model due to taking into account
density dependence and a carrying capacity for the population.

### Question 3 : comparing logistic and exponential population growth figure

I have provided a screenshot of the graph showing a comparison between
the exponential and logistic growth curves.

<img width="1011" alt="Screenshot 2023-12-06 at 16 02 48" src="https://github.com/LeahS03/logistic_growth/assets/150166853/33870464-41c8-454c-b885-37f5c11dcc01">




