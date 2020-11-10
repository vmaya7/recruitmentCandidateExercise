#--------------------------------
#
#         data_preprocessing.R
#
#--------------------------------
#The preprocessing.R file contains the necessary lines of code 
#to obtain a DataFrame ready to be analyzed using the linear regression model.

#-------------------------------------------------------------------------------

rm(list = ls()) # Clean the WorkSpace

#-----------------------------------------
#                 Libraries              -
#-----------------------------------------

library (ggplot2)
library(lubridate)
library(tidyverse)
library(data.table)
library(fastDummies)
library(stats)

#----------------------------------------
# Preprocessing DataFrame               -
#----------------------------------------

# Read the data 
data <- read.csv2("data.csv", 
                  sep = ',',
                  col.names = c('Date_Week', 'Media_Spend_USD', 
                                'Media_Campaign', 'Search_Volume'))

#----------------------------------------
# Transform from string type to date type

data$Date_Week <-data$Date_Week %>% 
  dmy()

#----------------------------------------
# Transform from string type to factor type

data$Media_Campaign <- data$Media_Campaign %>% as.factor()
  
#----------------------------------------
#Creating fitted graph
theme_set(theme_bw(base_size = 14))#theme set

