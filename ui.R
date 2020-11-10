library(shiny)
library(shinydashboard)

ui <- dashboardPage(skin = "green",
                    dashboardHeader(title = 'brand’s advertising spend', titleWidth = 270),
                    dashboardSidebar(
                      sidebarMenu(menuItem("Linear regression ", tabName = "home", icon = icon("dashboard")),
                                  
                                  menuItem("summary", tabName = "pais", icon = icon("globe-africa"))
                                  
                      ),
                      width = 250
                    ), # AQui se agregan más pestañas
                    #-------------------------------------------------------------
                    # Body  
                    dashboardBody(
                      
                      tabItems (
                        #--------------------------Página 1
                        tabItem(
                          tabName = "home", fluidRow(
                            valueBoxOutput("value1")
                            ,valueBoxOutput("value2")
                            ,valueBoxOutput("value3")
                          ), fluidRow(
                            box(title = "Retention Factor [0,1]", status = "primary", solidHeader = TRUE, sliderInput("slider", "Number of observations:",min =  0, max =  1, value = 0.8, step = 0.1), height = 500), 
                            box(title = "Lista de éxitos global", status = "primary", solidHeader = TRUE, DT::dataTableOutput("view"),  height = 500)
                            )
                        )
                      )
                    )
)
