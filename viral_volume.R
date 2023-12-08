install.packages("janitor")
install.packages("dplyr")
library(ggplot2)
library(janitor)
library(dplyr)

# This is calling the data from the csv file
viral_data <- read.csv("Cui_etal2014.csv")

# V = BL^a is the equation describing the virion volume
# so we need to use volume and length to determine the exponential and scaling factor
# log(V) = log(B*L^a) ==
#log(V) = log(B) + alog(L)
# putting this into linear terms : Y = mx + c 
# log(V) = alog(L) + log(B)
# so log(B) = c, a = m
# by creating a linear model and determining the intercept and gradient - we find our missing variables


# clean_names() removes spaces and caps from the data. The function allows us to plot data using the new names

viral_data_c <- viral_data %>%
  clean_names()
# This returns the new names of the headings
head(viral_data_c)

# This code calculates the exponent and scaling factor for dsviruses
# Now we are plotting genome length agasint virion volume
# geom_point() creates our scatter plot


# Below I have created a new data set that transforms the x and y data by the log function
log_viral_data_c <- viral_data_c %>%  
  mutate(log_vol = log(virion_volume_nm_nm_nm)) %>% 
  mutate(log_length = log(genome_length_kb))

# I then make a plot based on this new dataset
viral_plot <- ggplot(aes(log_length,log_vol),data = log_viral_data_c) + 
  geom_point() +
  
  # Geom_smooth(method = lm) plots a straight line with error bars to the data
  #theme(axis.title = element_text(face = 'Bold')) +
  geom_smooth(method = lm) +
  # xlab and ylab are used to create the axis names
  xlab('log[Genome length(kb)]') +
  ylab('log[Virion volume (nm3)]') +
  # the below line sets the background to white with a black outline
  theme_bw() +
  # this code makes the text pold and adjusts the font
  theme(axis.title = element_text(face = 'bold', size = '8'))
# this runs the plot
viral_plot

# this code creates are linear model. summary returns statistical output from this, including gradient and y intercept
viral_model <- lm(log_vol ~ log_length, data = log_viral_data_c)
summary(viral_model)
#log_viral_data_c <- viral_data_c %>%  
# mutate(log_vol = log(virion_volume_nm_nm_nm)) %>% 
#          mutate(log_length = log(genome_length_kb))


#Coefficients:
#  Estimate Std. Error
#(Intercept)   7.0748     0.7693
#log_length    1.5152     0.1725

# log(V) = alog(L) + log(B)
# so if we know that log(B) = c, a = m
#our c is log(length) which is log(B) = 7.048
#so B = exp(7.0748) = 1181.807
#our  a is m, we have m which is 1.5152
#so m = exp(7.0748) = 1181.807

# function estimating volume if kb = 3 

vol_estimate <- function(length) {
  
  vol <- 1181.807 * 300^1.5152
  return(vol)
  
}
vol_estimate(300)

# This gives 6697006



                     