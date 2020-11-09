rm(list = ls()) # Clean the WorkSpace
#-----------------------------------------
#                 Libraries              -
#-----------------------------------------

library (ggplot2)
library(lubridate)
library(tidyverse)
library(data.table)
library(fastDummies)

#----------------------------------------

# Read the data 
data <- read.csv2("data.csv", 
                  sep = ',',
                  col.names = c('Date_Week', 'Media_Spend_USD', 
                                'Media_Campaign', 'Search_Volume'))

# Transform from string type to date type
data$Date_Week <-data$Date_Week %>% 
  ymd()


# Transform from string type to factor type 
data$Media_Campaign <- data$Media_Campaign %>% as.factor()
  

# Exploratory graph of Search_Volume
g <- ggplot(data, aes(x = Date_Week , y = Search_Volume))

g +  geom_point(size = 2, aes( color = Media_Campaign)) + geom_line(size = 1, alpha = 0.5) # +  facet_grid(Media_Campaign~ .)


# Exploratory graph of Media_Spend_USD
g <- ggplot(data, aes(x = Date_Week , y = Media_Spend_USD  ))
g + geom_line()


# Defining factor retention
Retention_Factor <- 0.3

Adstock <- function(X, Retention_Factor)
{
  return (as.numeric(stats::filter(X, Retention_Factor, method="recursive"))) 
}

#Creating the Media_Adstock variable
data$Media_Adstock <- Adstock(data$Media_Spend_USD, Retention_Factor)


# Exploratory graph of Media_Adstock
g <- ggplot(data, aes(x = Date_Week , y = Media_Adstock))
g + geom_line()



# Creating a lineal model 

lineal_model <- lm(data$Search_Volume ~ data$Media_Adstock + data$Media_Campaign)
summary(lineal_model)
