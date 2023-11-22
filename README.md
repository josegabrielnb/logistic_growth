**Question 1**  
**Introduction**  
The purpose of this analysis was to determine the initial population size of a bacterial cultyre, the rate of growth and the carrying capacity of the population. The model is based on a population of bacteria formed from 900µl of growth media and 100µl of *E.coli* mixed together in a test tube. The test tube was then left for a duration of time to allow the bacteria to grow, so that the dyanmics of population growth can be modelled. *E.coli* grow very quickly and so in an environment rich in resources, i.e. the growth media, the bacteria will undergo exponential growth. However, when the resources are used and there is little left, the population will cease to grow and will become bacteriostatic as the population cannot grow any further. This is the maximum that the population can grow to and is known as the carrying capacity, or the parameter, k. 
The exponential growth of the population can be modelled through: 
$ Nt = (K * N0 * e^r^t)/(K - N0 + N0 * e^r^t) $

**Methodology**  
In order to model the population growth, a repository from GitHub was forked containing the relevant data (experiment3.csv). The repository was forked to create a copy and a devolpment branch was created inside this fork so that any changes that are made are not immediately committed to the main branch. A license and README file were added before the analysis could begin.
To complete the analysis, Posit Cloud was used as an RStudio interface that could be pushed to GitHub. Three scripts were used in PositCloud to fully analyse data. These scripts were named, plot_data, fit_linear_model, and plot_data_and_model.
In plot_data, modelling of the population began by plotting the exponential growth of the bacterial population. Using the ggplot2 package, a sigmoidal growth curve was produced, with time (t) (arbitrary units) on the x axis and population size on the y (y). 
The second part of the plot_data script involved transforming the exponential data through a logarithmic transformation which linearlised the data. This could then be plotted as a log10 transformation of the exponential data.

In the second script, fit_linear_model, the parameters of the model could be elucidated through a linear model approximation. Two cases were looked at specifically to determine the model parameters. The first case was when K (the carrying capacity) >> N0 (i.e. K is much larger than the initial population size), when t is small (t~0). Modelling this would allow us to determine the rate that the population would have to grow at to reach k, therefore providing the r parameter. The second case looks at when Nt = k, or when the population size at time t is equal to k, i.e. when the population has reached the carrying capacity. Completing a linear model of this allows the carrying capacity to be determined. 

The first and second scripts provide the parameters that are needed to estimate the initial population size in the third script. The thrid script, plot_data_and_model, both the data and model are plotted against each other to determine the accuracy of the estimates of k and r, while also allowing estimation of the initial population size. To find the initial population size, the value of k must be imputted into the equation: 
$ N0 = e ^N^t $ 

**Results**  
**plot_data:**
As mentioned, this graph showed a sigmoidal growth curve frpom 0e+00 at N0 to approximately 5e+09 at the plateau, k. This script generated both exponential and logarithmic models of the bacterial population growth. These were displayed on graphs with time (t) (arbitrary units) on the x axis and population size on the y (y), and allowed us to visualise the data.

**fit_linear_model:**
This script allowed for estimation of the parameters in the logarithmic model through the exploration of two specific cases. In case 1, k >> N0, and t ~ 0. In this case, I chose t < 1000 to ensure that t is small and inputted this data into a linear regression model. The execution of this model in R provided an estimate of the parameter r, which in this instance is 5.007e-03, and also the initial population size (log-transformed), 8.512e+00. 
In case 2, Nt = k. This means that the population size at time t is equal to the carrying capacity, therefore allows us to find a value for the parameter, k. I chose a value of t > 3000 as this point in time is characterised by the population reaching the plateau, and inputted this value into the linear regression model. The summary table of the regression produced a value for k, 4.882e+09 (which appears to be an underestimation). 

**plot_data_and_model:**
This script allowed for the estimation of the initial population size of the bacterial culture and also plotted a model of population growth based on the parameters obtained in the previous scripts. To estimate the initial population size, N0 of the logarithmic model (8.512e+00) must become an exponent, to back transform the logarithmic. This produces a value of the initial population size, e^8.512e+00. This can then be modelled in a graph produced by ggplot, again with t on the x axis and y on the y axis. The black dots represent the data points for population size at time = t, and the red line shows the generated model of population growth. 

**Conclusions**  
The analysis allowed me to determine the initial population size of the bacterial population through the elucidation of the parameters, k and r. This allowed a model of population growth in a bacterial population to be observed in a sigmoidal growth curve with help from a logarithmic transformation. This showed that the population size increased exponentially when resources were abundant, but decreased, plateaued and became bacteriostatic when the resources were scarce, thus allowing the population to reach carrying capacity. 
Despite the model being a close reflection of the data, some improvements could be made, for example, the model could be a closer fit to the data, which would therefore more accurately represnt population growth of an *E.coli* culture in a test tube. A higher level of accuracy could come from using a larger value of t in the fit_linear_model script. The use of a smaller value of t, i.e. a value that doesn't reflect the time point when the population reached its carrying capacity means that the estimation of both k and N0 are lower than they should be. If I were to repeat this analysis, I would use a higher value of t, for example t > 3500, because at this point in time, the bacterial population had become bacteriostatic as was no longer increasing, and therefore accurately represents the value of the carrying capacity. This in turn would allow a more accurate estimation of the initial bacterial population, and also a more accurate model of population growth. 

**Question 2**  

<img width="737" alt="Screenshot 2023-11-22 at 12 00 16 pm" src="https://github.com/lanonmymoush/logistic_growth1/assets/151572854/288c6248-f56d-4b07-bc01-778160e20f38">



