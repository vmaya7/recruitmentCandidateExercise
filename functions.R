#--------------------------------
#
#         functions.R
#
#--------------------------------


#-------------------------------------------------------------------------------
#                                   adstock

#Input:
#  
#  X: DataFrame Column
#
#  Retention_Factor: The RFis the Retention Factor [0,1] 
#                    describing the proportion of the media pressuretheis 
#                    carried over from week to week.
#Output:
#  
#  DataFrame column with the The Adstock calculation

#http://stackoverflow.com/questions/14372880/simple-examples-of-filter-function-recursive-option-specifically
  

Adstock <- function(X, Retention_Factor)
{
  return (as.numeric(stats::filter(X, Retention_Factor, method="recursive"))) 
}

#-------------------------------------------------------------------------------
#                                 linear_graph
#Input:
#  
#  data: DataFrame
#
#
#Output:
#  
#  GGplot graph (Search Volume) with the fitted values form linear 
#  regression and real.

linear_graph <- function(data){
  
  
  g_fitted <- ggplot (data, aes(x = Date_Week)) #Base graph 
  
  g_fitted + 
    geom_line(aes(y = Search_Volume, color = 'Real Values'),alpha = 0.4, 
              linetype = 'twodash',size = 1.1) + # Real values 
    
    geom_line(aes(y = fitted_values, 
                  color = 'Fitted Values' ), size = 1.5) + #fitted values
    labs(x = 'Date (week)', y = 'Search Volume', 
         title = "Fitted Values vs Real Values",
         subtitle = 'Linear Regression approach') + 
    
    theme(plot.title = element_text(size = 15, face = "bold")) +
    scale_color_discrete("Values:")  
}
#-------------------------------------------------------------------------------
