# Question 1
### Introduction to the analysis
The analysis aimed to estimate experimental parameters of a non-linear model using linear equations.
The experiment looked at bacterial population growth and the unknown parameters were: initial population size (*N<sub>0<sub>*), rate of growth (*r*), and carrying capacity (*K*).

Bacterial population growth can be described with the logistic growth model. This is because the bacteria cannot grow infinitely; there are density-dependence factors, e.g. competition and limited resources, that limit population growth and cap the population size at the maximum carrying capacity.

--- 
**The logistic growth model**\
The logistic growth model is a non-linear model. The number of bacterial cells, *N*, at time, *t* is given by:
```math
\begin{equation}
N(t) = \frac{K N_0 e^{rt}}{K-N_0+N_0 e^{rt}}
\end{equation}
```

Visualisation of the logistic growth model shows an S-shaped curve. It shows that initial population growth is exponential and eventually plateaus.

The plot can be transformed by taking logs of N to produce a semi-log plot. Using log(N) linearises the exponential growth by compressing the data that spans several magnitudes. The semi-log plot shows an initial linear relationship (red) and a linear relationship when the line plateaus (blue).

<p align="center">
   <img width="1434" src="https://github.com/josegabrielnb/reproducible_research/blob/main/images/logistic_growth(2).png">
</p>

*Figure 1: Graph to show two ways of visualising the logistic growth model.*  
Image source: https://github.com/josegabrielnb/reproducible_research  

---
**Linear relationships in the logistic growth model**\
Initially, when *t* is small, *K* is much greater than *N*. Therefore, the logistic growth equation can be rearranged to: 
```math
\begin{equation}
N(t) = N_0 e^{rt}
\end{equation}
```

During the second, linear relationship, *t* tends towards infinity. After rearranging the equation, the later linear relationship where N plateaus is given by:
```math
\begin{equation}
\lim\limits_{t \to \infty} N(t) = K
\end{equation}
```
---
**Using linear approximations to estimate parameters**  
The equation of the line is given by:
```math
\begin{equation}
N = b + mt
\end{equation}
```
Where b is the y-intercept, and m is the slope of the line. The equations derived from the logistic growth model can be used to estimate the values of *N<sub>0<sub>*, *r*, and *K*.

The initial stage is defined by the equation:  
```math
\begin{equation}
N(t) = N_0 e^{rt}
\end{equation}
```
Which can be rearranged by taking logs to:
```math
\begin{equation}
ln(N) = ln(N_0) + rt
\end{equation}
```

The initial stage is linear; the equation of a line is:
```math
\begin{equation}
N = b + mt
\end{equation}
```

So, after fitting a line to this initial stage, the y-intercept of the line (b) will approximate ln(N0) and the slope of the line (m) will approximate *r*.  


Similarly, the second linear equation can be rearranged to have the same format as the equation of a line:
```math
\begin{equation}
N(t) = K + 0 \cdot t
\end{equation}
```
Therefore, the y-intercept of this line will approximate *K*.

---

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

At *t*=4980 min, according to the exponential growth model, population size is:
```math
\begin{equation}
N(4980) = 3.208709{e+14}
\end{equation}
```
```math
\begin{equation}
N(4980) = 3.208709 * 10^{14}
\end{equation}
```
```math
\begin{equation}
N(4980) = 3.21 * 10^{14} (2 d.p)
\end{equation}
```

The population size predicted under logistic growth:
```math
\begin{equation}
N(4980) = 4997922151
\end{equation}
```
```math
\begin{equation}
N(4980) = 4.997922151 * 10^{9}
\end{equation}
```
```math
\begin{equation}
N(4980) = 5.00 * 10^{9} (2 d.p)
\end{equation}
```

The population size at 4980 minutes in the exponential growth model is much larger (5 orders of magnitude) than the population size predicted under logistic growth.  

This was expected because exponential growth assumes that the per capita growth rate is the same regardless of population size. Therefore, the population is expected to grow faster with more individuals. In logistic growth, the per capita growth rate decreases as population size draws closer to the maximum carrying capacity.

***

# Question 3:
See repository for the R script and additional comments: exp_log_growth_curves.R

Below is a .png version of the graph.
<p align="center">
   <img width="1434" src="https://github.com/pepperepperepper/logistic_growth/blob/dev/exp_log_growth_curves_fig.png">
</p>


