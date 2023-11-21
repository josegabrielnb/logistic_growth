#Script to plot data and model

growth_data <- read.csv("experiment2.csv") #loading the growth data 

#creating a function of the logistic growth equation 
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#adding in the values of N0,r and k that are derived from the outputs of model1 and model2
N0 <- exp(8.186598)
  
r <- 0.025874
  
K <- 999877492

#plotting a graph with the raw data and the logistic model
data_model_graph <- ggplot(data=growth_data, aes(x=t, y=N)) +
  geom_function(fun=logistic_fun, colour="red") +
  geom_point()+
  theme_bw()+
  labs(x="Time(m)", y="Number of E. coli", 
       title = "Growth of E. coli with a logistic model")+
  theme(plot.title = element_text(hjust=0.5))
data_model_graph



