# Question 1
### Introduction to the analysis
The analysis aimed to estimate experimental parameters of a non-linear model using linear equations.
The experiment looked at bacterial population growth and the unknown parameters were: initial population size (*N<sub>0<sub>*), rate of growth (*r*), and carrying capacity (*K*).

Bacterial population growth can be described with the logistic growth model. This is because the bacteria cannot grow infinitely; there are density-dependence factors, e.g. competition and limited resources, that limit population growth and cap the population size at the maximum carrying capacity.

**The logistic growth model**\
The logistic growth model is a non-linear model. The number of bacterial cells, *N*, at time, *t* is given by:
```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```

Visualisation of the logistic growth model shows an S-shaped curve. It shows that initial population growth is exponential and eventually plateaus.

The plot can be transformed by taking logs of N to produce a semi-log plot. Using log(N) linearises the exponential growth by compressing the data that spans several magnitudes. The semi-log plot shows an initial linear relationship and a linear relationship when the line plateaus.

**Linear relationships in the logistic growth model**\
The initial linear relationship is given by the equation:
```math
\begin{equation}
N(t) = N_0 e^{rt}
\end{equation}
```
This is when *K* is much greater than *N* and *t* is small.


The later linear relationship where N plateaus is given by the equation:
```math
\begin{equation}
\lim\limits_{t \to \infty} N(t) = K
\end{equation}
```
This is when *t* tends towards infinity.

**Using linear approximations to estimate parameters**
The equation of the line is given by:
```math
\begin{equation}
y = b + mx
\end{equation}
```
The equations derived from the logistic growth model can be used to estimate 


```math
\begin{equation}
ln(N) = ln(N_0) + rt
\end{equation}
```

```math
\begin{equation}
N(t) = K + 0 \cdot t
\end{equation}
```

Fitting a linear model 
For the initial equation:
y = ln(N)
intercept = ln(N0)
slope = r

### Results

The parameter esimates for *experiment3.csv* were:
> *N<sub>0<sub>* = exp(8.517e+00) = 4999.034\
*r* = 4.997e-03\
*K* = 4.998e+09
>

***

# Question 2:
The exponential growth formula is:
```math
\begin{equation}
N(t) = N_0e^{rt}
\end{equation}
```

At *t*=4980 min according to the exponential growth model:
> N(4980) = 3.208709e+14
>

The population size predicted under logistic growth:
> N(4980) = 4997922151

The population size at 4980 minutes in the exponential growth model is much larger than the population size predicted under logistic growth.
***

# Question 3:
