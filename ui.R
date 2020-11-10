#--------------------------------
#
#         ui.R
#
#--------------------------------

#The ui.R file contains the visual part of this shinny app.
#The app has 3 main parts:

#   * Slidebar - Controls Retention Factor

#   * ggplot2 grpah - Show the fitted model and observed data

#   * Efficiencies box - Show the Efficiencies of the campagins 


#-------------------------------------------------------------------------------

library(shiny)
library(shinydashboard)

#-------------------------------------------------------------------------------
# Dashboard page configuration

ui <- dashboardPage(skin = "green",
                    dashboardHeader(title = 'brand’s advertising spend', 
                                    titleWidth = 270),
                    dashboardSidebar(
                      sidebarMenu(menuItem("Linear regression ", 
                                           tabName = "home", 
                                           icon = icon("dashboard")),
                      sliderInput("slider", "Retention Factor:", min =  0,
                                  max =  1, value = 0.8, step = 0.1)
                      ),
                      width = 270
                    ), 
                    
#-------------------------------------------------------------------------------
# Dashboard page configuration

                    dashboardBody(
                      
                      tabItems (
                        
#-----------------------
# Efficiencies boxes
                                              
                        tabItem(
                          tabName = "home", fluidRow(
                            box( # Efficiencies boxes
                            valueBoxOutput("value1")
                            ,valueBoxOutput("value2")
                            ,valueBoxOutput("value3"),
                            width=12,
                            title = 'Efficiencies',
                            status = "primary", solidHeader = TRUE
                            
                            )
                          ), 
#-----------------------
 # Adstock Model Plot

                          fluidRow(
                            box(title = "Adstock Model", status = "primary", 
                                solidHeader = TRUE, plotOutput("plot"), 
                                width=12)
                          )
                        )
                      )
                    )
)
