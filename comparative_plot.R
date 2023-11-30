#Script to plot data and model
install.packages("ggplot2")
install.packages("ragg")
library(ggplot2)
library(ragg)


growth_data <- read.csv("experiment1.csv")

# The estimated parameters
N0 <- exp(6.883) 
r <- 10^(-2) 
K <- 6e+10

# Functions
logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

exponential_fun <- function(t){
  N <- N0*exp(r*t)
  return(N)
}


#Plot
comparative_plot <- ggplot(aes(t,N), data = growth_data) +
  geom_function(fun=logistic_fun, aes(colour="Logistic growth")) +
  geom_function(fun=exponential_fun, aes(colour="Exponential growth")) +
  geom_point(aes(y=N, colour="Experimental data")) +
  labs(x="Time (minutes)", y="Population Size (N)", title="Comparison of Exponential and Logistic Growth Curves") +
  scale_y_continuous(label=scales::scientific, limits=c(0, 1e11)) +
  theme_bw()+
  theme(text = element_text(size=14),
        plot.title = element_text(size=15, hjust = 0.5, margin = margin(b=20)),
        axis.title = element_text(size=14),
        legend.title = element_blank(),
        legend.position = "right")+
  scale_color_manual(values = c("Experimental data" = "blue", "Exponential growth" = "red", "Logistic growth" = "purple"),
                     labels = c("Experimental data", "Exponential growth", "Logistic growth")) +
  guides(colour = guide_legend(override.aes = list(
    linetype = c("blank", "solid", "solid"),
    shape = c(16, NA, NA),
    size = c(2, 1, 1))))

#save the figure
agg_png("figures/comparative_plot1.png", 
        width = 1000, height = 800, units = "px", res=135)
comparative_plot
dev.off() #shuts down the current device

