## server.R

library(shiny)
library(shinydashboard)
###################################################################################################################################3
###### SERVER
server <- function(input, output) { 
  ##############################################################################
  #primera pestaña
  #-----------------------cajas

  #------------------------------------------------
  
  output$value1 <- renderValueBox({
    valueBox(
      formatC(100,10, format = "d", big.mark = ','), "Total de views",icon = icon("chart-line")
      ,color = "green")
    
  })
  
  output$value2 <- renderValueBox({
    valueBox(
      formatC(100,10, format = "d", big.mark = ','), "Total de views",icon = icon("chart-line")
      ,color = "green")
    
  })
  
  output$value3 <- renderValueBox({
    valueBox(
      formatC(100,10, format = "d", big.mark = ','), "Total de views",icon = icon("chart-line")
      ,color = "green")
    
  })
  
  #------------------------------------
  
  
  output$view <- NULL 
#    DT::renderDataTable({
#    top20
#  })
  
  output$plot5top <- NULL

  
  
  
}
