#Script to plot the logistic growth data

growth_data <- read.csv("experiment1.csv")

install.packages("ggplot2")
library(ggplot2)


ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

### Let's plot log transformed N data

ggplot(aes(t,log(N)), data = growth_data) +
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


## Let's plot the same data for the third experiment

data_exp_3 <- read.csv("experiment3.csv")

ggplot(aes(t, N), data = data_exp_3) +
  geom_point()

ggplot(aes(t,log(N)), data = data_exp_3) +
  geom_point() +
  xlab("t") +
  ylab("y log(N)") +
  ggtitle("E.coli growth, exp 3") +
  scale_y_continuous(trans='log10')

