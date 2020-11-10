## server.R



source('data_preprocessing.R')
source('functions.R')
library(shiny)
library(shinydashboard)

Retention_Factor <- 0.8
###################################################################################################################################3
###### SERVER
server <- function(input, output) { 
  ##############################################################################
  #primera pestaña
  
  
  newData <- reactive({ 
    
    data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
    lineal_model <- lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
    lineal_model_fitted <- lineal_model$fitted.values
    data$fitted_values <- lineal_model_fitted
    return(data)
    

  }) 
  
  output$plot<-renderPlot({
    linear_graph(newData())
  })
    
  


#data$Media_Adstock <- Adstock(data$Media_Spend_USD, Retention_Factor)
#
##----------------------------------------
## Creating a linear model 
#
#lineal_model <- lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
#
#
#lineal_model_fitted <- lineal_model$fitted.values
#
#data$fitted_values <- lineal_model_fitted
#
##----------------------------------------
#
##----------------------------------------
## Get eficiencias
#
## Campaign
campaign1 <- Retention_Factor
campaign2 <- Retention_Factor
campaign3 <- Retention_Factor

#-----------------------------------------
#Campaing1
Campaing1_f <- reactive({ 
  
  data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
  lineal_model <- lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
  campaign1 <- as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[4])
  return(round(campaign1, 2))
})

#----------------------------------------
#Campaing2
Campaing2_f <- reactive({ 
  
  data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
  lineal_model <- lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
  campaign2 <- as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[2] +lineal_model$coefficients[4])
  return(round(campaign2, 2))
})

#----------------------------------------
#Campaing1
Campaing3_f <- reactive({ 
  
  data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
  lineal_model <- lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
  campaign3 <- as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[3] +lineal_model$coefficients[4])
  return(round(campaign3, 2))
})

#----------------------------------------
#
#campaign2 <- as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[2] +lineal_model$coefficients[4])
#
#campaign3 <- as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[3] +lineal_model$coefficients[4])
#  
#g_fitted <- ggplot (data, aes(x = Date_Week))
#g_fitted + 
#  geom_line(aes(y = Search_Volume, color = 'Real values'),alpha = 0.4, 
#            linetype = 'twodash',size = 1.1) +
#  geom_line(aes(y = fitted_values, color = 'Fitted Values' ), size = 1.5) +
#  labs(x = 'Date (week)', y = 'Search Volume', 
#       title = "Fitted values vs real values",
#       subtitle = 'Linear Regression aproach')+
#  theme(plot.title = element_text(size = 15, face = "bold")) +
#  scale_color_discrete("Values:")  
  
  
  #-----------------------cajas

  #------------------------------------------------
  
  output$value1 <- renderValueBox({
    valueBox(
      Campaing1_f(), "Campaign #1",icon = icon("chart-line")
      ,color = "green")
    
  })

output$value2 <- renderValueBox({
    valueBox(
      Campaing2_f(), "Campaign #2",icon = icon("chart-line")
      ,color = "green")
    
  })
  
  output$value3 <- renderValueBox({
    valueBox(
      Campaing3_f(), "Campaign #3",icon = icon("chart-line")
      ,color = "green")
    
  })
  
  #------------------------------------
  


  
  
  
}
