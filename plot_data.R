#Script to plot the logistic growth data

growth_data <- read.csv("???")

install.packages("ggplot2")
library(ggplot2)

data_exp_1 = read.csv("experiment1.csv")


ggplot(aes(t,N), data = data_exp_1) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

### Let's plot log transformed N data

ggplot(aes(t,log(N)), data = data_exp_1) +
  geom_point() +
  xlab("t") +
  ylab("y log(N)") +
  ggtitle("E.coli growth, exp 1") +
  scale_y_continuous(trans='log10')


## Let's plot the same data for the second experiment

data_exp_2 <- read.csv("experiment2.csv")

ggplot(aes(t, N), data = data_exp_2) +
  geom_point()

ggplot(aes(t,log(N)), data = data_exp_2) +
  geom_point() +
  xlab("t") +
  ylab("y log(N)") +
  ggtitle("E.coli growth, exp 2") +
  scale_y_continuous(trans='log10')


