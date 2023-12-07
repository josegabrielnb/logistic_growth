#calculate N assuming exponential growth
N0 <- exp(6.883)
r <- 0.01004
t <- 4980

N <- N0 * exp(r * t)  #exponential growth equation

N  # show result

#create function for exponential growth
exponential_growth <- function(t, N0, r){
  N0 * exp(r*t)
}

#plot graph comparing exponential and logistic growth curves
exponential_vs_logistic_figure <- ggplot(aes(t,N), data = growth_data) +
  geom_function(fun = logistic_fun, colour = "red") +
  geom_function(fun = exponential_growth, args = list(N0 = N0, r = r), colour = "blue") +
  geom_point() + 
  labs(title = "Comparrison of Logistic and Exponential Growth Curves",
       x = "Time", y = "Population Size") +
  annotate("text", x = mean(growth_data$t),  #Add text to graph
           y = max(growth_data$N) * 19990000000000, 
           label = c("Logistic curve = red",
                     "Exponential curve = blue", 
                     "Data = black"),
           vjust = c(3, 1.5, 0)) +
  theme_bw()

print(exponential_vs_logistic_figure)  #show figure

#save figure as pdf
pdf("exponential_vs_logistic_figure.pdf", 
    width = 9.9, height = 6.9)
exponential_vs_logistic_figure
dev.off()
