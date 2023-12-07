Reproducible figures assignment
--------------------------------------------------------------------------------------
These are my answers to questions 1, 2 and 3 for the reproducible figures/GitHub assignment.


Question 1
----------
The point of the experiment is to investigate various growth properties of a sample of _Escherichia coli_ bacteria grown in media. Thus, we have to analyse/model the experimental data we obtain.

Our analysis, like any, must have a number of properties. First, it must be transparent: we have to be very clear about what we are doing in our analysis at any point, and explain methods sufficiently. We need to make sure we do this both consciously (not purposely hiding anything in the analysis, such as results we received that didn't quite fit our hypotheses) and subconsciously (making sure our processes are well explained and easily understandable). 
Second, it must be accessible. Our analysis and any data that goes along with it must be made public (with some limitations, such as being available through subscription to a journal). Accessible work also means supplying, for example, code that was used to analyse data, so readers know how we came to our conclusions. This links to transparency. 
Lastly, our analysis must be reproducible. This means that when someone tries to replicate it, as long as they do things correctly, they should be able to reach the conclusions we reached using only our descriptions of methods and requirements. For example, if they try running a code we supplied using the data we supplied, and there are no software issues, they should come to the same analytical conclusions. 


Our analysis begins with modelling the growth of the bacteria. The equation uses the following parameters:

-N: Population size (initial populatiom size denoted by N0), which is a constant
-K - Carrying capacity - the maximum number the population can reach, also a constant
-r - The instantaneous growth rate
-t - Time

We can vary these to create different models and predict how the bacterial population size will respond to different parameters. For example, we can discover how the population size looks early in the experiment and when carrying capacity is much larger than the initial population size. This results in us being able to cancel out various terms and simplify the equation. For example, if K is very large and N0 is very small in comparison, the term N0 + N0e^rt can be cancelled out, because assuming t=0, e^rt = e^0 = 1, so the term will be essentially N0 + N0, and if these are very small then minusing them from K will have negligible effect.

In Figure 1 seen in the Logistics Growth handout, K is 6e+10, and N0 is close to 0. When the model is plotted, it forms a sigmoidal curve, where the bacteria grow slowly at first before undergoing exponential growth and finally reached carrying capacity. However, when the number of cells is transformed using a natural log, the growth rate is constant in earlier stages of the experiment before again reaching a plateau.

This model can also be used in conjunction with real experimental data. knowing that the equation of a simple straight line is y=b+mx, and remembering that log transforming exponential growth results in a straight line at low t values, we can apply the model to approximate real life bacterial growth. If both K and t are small, then through substituting K, N0, ln(N), t and r into the simple line equation and cancelling out ln(e)=1  results in obtaining the approximate model equation ln(N) = ln(N0) + rt. To explain this graphically, ln(N) is the variable on the y axis ie. the dependent variable, ln(N0) is b ie. where the line intercepts the y axis and x is 0, t is the variable on the x axis, and r is the gradient. Alternatively, when t is large and the bacterial population is close to carrying capacity, the approximate equaation will be N(t) = K + 0*t, which translates to N=K. 




-Results-

The experimental data can be plotted using R code. By inputting a file containing the experimental data, you can plot a graph of how the bacterial population size changes over time, and from that, you can determine the N0, K and r values that can be inputted into the model equation and complete the analysis.

I used the csv file experiment2.csv. First, I determined N0 simply from reading the first line of the csv file using the head() function, and I found N0=1879. Then, using the ggplot() function and reading the file into the program using the read.csv() function, I obtained a graph similar to the graph in Figure 1 of the Logistic Growth handout. This allowed me to determine the K value to be approximately 1e+09. Finally, using the equation N(t) = N0*e^rt at a low value of t, and using the values N=12127 and t=60 which I found from the dataset, I found r to be around 0.031. I checked this using the logarithmic equation ln(N) = ln(N0) + rt, and entering my values for N, N0 and t into that, and also by using the values N(t)=73300 and t=120. I received the same answer. 

This concludes my analysis. I realise that although models can be useful, they are never correct, and bacterial population size can never be exactly correctly determined. However, models like these allow us to estimate closely enough to the actual value to be functionally helpful. 



Question 2
----------

Using my estimates of 1879 for N0, 1e+09 for K and 0.031 for r, I found the population size to be 2.091*10^70 at t=4980. This is physically impossible, and is a much larger than the population size predicted by the logistic growth model, which predicts the population to have reached the carrying capacity of 1e+09 long before that point. This is due to the fact that the exponential equation only works for lower values of t, and doesn't take into account the plateau that the bacteria reaches at around 700 minutes. Applying this biologically, the carrying capacity represents the maximum amount of bacteria that can occupy the test tube, due to factors such as limited resources and space restraints. Once this limit is reached, the rate of replication slows to 0. However, the exponential model doesn't apply an upper limit, and so is biologically inaccurate for values of t larger than around 2000. 



Question 3
----------
Link to my R code in my reproducible-research homework repo: 

This is my graph comparing the two functions: ![comparison graph](images/image.png)





