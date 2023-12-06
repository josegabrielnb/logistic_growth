# Logistic growth 

### Assignment questions 

###Question 1### 

- detailed explanation of the analysis
- analysis on no. bacteria every hour during its growth
- Looking at the growth of bacteria in a test tube - wil start growing rapidly, then growth will decreease and reach a max capacity (no longer will grow) - reaches carrying capacity [explain what this is] 
- interested in finding out what this max capacity (k) is, intital population size (N0) (t=0), rate of growth (r)
- interested in this because then can find out number of cells at any given time
- can find these different variables using equation :
- Nt = (K*N0*e^rt)/(K-N0+N0e^rt)
- visually represented as a sigmoidal model - but in order to obtain N, r, K, easier to log-transform the data (number of cells) and fit two linear regressions [producing linear approximiations to this sigmoidal model which two linear models can be fitted to]
- The linear approximation when K ≫ N0 and t is small would be:
ln(N) = ln(N0) + rt - so N0 is the y intercept
- On the other hand, when t is large and the population size remains constant
we can use the following approximation :
N(t) = K + 0 · t -> K is y when the second linear regression is flat
- repository uses data from "experiment1.csv"
- to find N and t, subset the growth data to before the point growth was constant - fitting a linear model to earlier time finds N0 and t 
- data_subset1 <- growth_data %>% filter(t<1600) %>% mutate(N_log = log(N))
- fit a linear model to the data subset model1 <- lm(N_log ~ t, data_subset1)
- found estimate of intercept to be 6.903e+00 - to obtain N0 did e to the power of this estimate
- N0 <- 995.256
- r is just the output from model 1 which is the estimate of t
- r <- 9.990e-03
- to obtain k subset the data to where the gradient is 0 - no more growth (N=K) - fitting linear model at later time points helps to find K
- data_subset2 <- growth_data %>% filter(t>2400)
- then fit a linear model to this model2 <- lm(N ~ 1, data_subset2)
- K is the estimate of the intercept output
- K <- 6.000e+10 #exp not needed - K has not been under the ln function, obtained from model 2 estimate

answers  :

N0 <- 995.256 #this is obtained from output of model 1, in which you do e to the power of the estimate of intercept to get N0 
#exp(6.903e+00) 

r <- 9.990e-03 #this is the output from model 1, it is the estimate of t 
  
K <- 6.000e+10 #exp not needed - K has not been under the ln function, obtained from model 2 estimate


###Question 2### 

N0 <- 995.256
r <- 9.990e-03 
t <- 4980 

exponential growth :

N(t) = N0e^rt 

N(4980) = (995.256) * e^((9.990e-03)*4980) 

N(4980) = 4.019501e+24

logistic growth : 

N(t) = (K*N0*e^rt) / (K - N0 - (N0*e^rt)) 

N(4980) = (6.000e+10*995.256*exp(9.990e-03*4980)) / (6.000e+10-995.256+exp(9.990e-03*4980))

N(4980) = 2.411701e+35 / 4.03866e+21

N(4980) = 5.971538e+13 

When comparing the outputs from the two growth models, the number of cells present at t=4980 under the exponential growth model is higher than that for the logisitic growth model. Exponential growth takes the same positive growth rate regardless of population size, while for the logistic model, population growth will begin to decrease as we reach the carrying capacity of the population. This is because the logistic growth model is more realistic, taking into account limited resources, such as space or nutrients, that will limit the number of cells in the population as population grows. 4980 minutes is the end of the experimental time period, so the carrying capacity is already reached. 

###Question 3###  





###Question 4###  

###Question 5### 






