#--------------------------------
#
#         functions.R
#
#--------------------------------
library(stats)

#--------------------------------
#           adstock

#Input:
#  
#  X: DataFram Column
#
#  Retention_Factor: The RFis the Retention Factor [0,1] 
#                    describing the proportion of the media pressuretheis 
#                    carried over from week to week.
#Output:
#  
#  DataFrame column with the The Adstock calculation
  
  


Adstock <- function(X, Retention_Factor)
{
  return (as.numeric(stats::filter(X, Retention_Factor, method="recursive"))) 
}

linear_graph <- function(data){
  
  
  g_fitted <- ggplot (data, aes(x = Date_Week))
  g_fitted + 
    geom_line(aes(y = Search_Volume, color = 'Real values'),alpha = 0.4, 
              linetype = 'twodash',size = 1.1) +
    geom_line(aes(y = fitted_values, color = 'Fitted Values' ), size = 1.5) +
    labs(x = 'Date (week)', y = 'Search Volume', 
         title = "Fitted values vs real values",
         subtitle = 'Linear Regression aproach')+
    theme(plot.title = element_text(size = 15, face = "bold")) +
    scale_color_discrete("Values:")  
}

# http://stackoverflow.com/questions/14372880/simple-examples-of-filter-function-recursive-option-specifically