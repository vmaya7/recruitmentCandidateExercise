#--------------------------------
#
#         server.R
#
#--------------------------------

#The server.R file contains the logic behind of ui.R.


#--------------------------------------------------.----------------------------
# Initializing values

source('data_preprocessing.R') # Do the prepocesing
source('functions.R') # Get helper functions 
library(shiny)
library(shinydashboard)

Retention_Factor <- 0.8

#-------------------------------------------------------------------------------
# Server function
server <- function(input, output) { 

#------------------------------------------
# Reactive functions
  
  #Generate the data
  
  newData <- reactive({  # Update the dataframe with fitted values.
    
    data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
    
    lineal_model <- 
      lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
    
    lineal_model_fitted <- lineal_model$fitted.values
    data$fitted_values <- lineal_model_fitted
    
    return(data)
    

  }) 
  
  #Return the dataframe "data" uploaded
  output$plot<-renderPlot({
    linear_graph(newData())
  })
    
#-------------------------------------------------------------------------------
# Get Efficiencies of the campagins
  
#---------------------------------------
# Reactive functions
  
#Campaing1
  
  Campaing1_f <- reactive({ 
    
    data$Media_Adstock <- Adstock(data$Media_Spend_USD, input$slider)
    
    lineal_model <- 
      lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
    
    campaign1 <- 
      as.numeric(lineal_model$coefficients[1] + lineal_model$coefficients[4])
    
    return(round(campaign1, 2))
  })
  
#----------------------------------------
#Campaing2
  
  Campaing2_f <- reactive({ 
    
    data$Media_Adstock <- 
      Adstock(data$Media_Spend_USD, input$slider)
    
    lineal_model <- 
      lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
    
    campaign2 <- 
      as.numeric(lineal_model$coefficients[1] + 
                   lineal_model$coefficients[2] +lineal_model$coefficients[4])
    
    return(round(campaign2, 2))
  })
  
#----------------------------------------
#Campaing3
  
  Campaing3_f <- reactive({ 
    
    data$Media_Adstock <- 
      Adstock(data$Media_Spend_USD, input$slider)
    
    lineal_model <- 
      lm(data$Search_Volume ~ data$Media_Campaign + data$Media_Adstock)
    
    campaign3 <- as.numeric(lineal_model$coefficients[1] + 
                              lineal_model$coefficients[3] +
                              lineal_model$coefficients[4])
    
    return(round(campaign3, 2))
  })




#-------------------------------------------------------------------------------
# Render Efficiencies boxes

  
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
  

} # End server function
#-------------------------------------------------------------------------------