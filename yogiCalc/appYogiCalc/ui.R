library(shiny)

shinyUI(fluidPage(
  headerPanel("Yogi Calculation"),
  sidebarLayout(
    sidebarPanel(
      h3("Suryan Longitude"),
      fluidRow(
        column(6,
               numericInput("suryan_long_deg","degrees",0,min = 0, max = 360)
               ),
        column(6,
               numericInput("suryan_long_min","min",0,min = 0, max = 60)
               )
      ),

      h3("Chandran Longitude"),
      fluidRow(
        column(6,
               numericInput("chandran_long_deg","degrees",0,min = 0, max = 360)
        ),
        column(6,
               numericInput("chandran_long_min","min",0,min = 0, max = 60)
        )
      ),
      br(),
      h3("Total degrees and minutes"),
      textOutput("totdegmin")
      
    ),
    mainPanel(
      fluidRow(
        column(6,
               wellPanel(htmlOutput("getstarhouse"))
               ),
        column(6,
               wellPanel(htmlOutput("getstarhouseplanet"))
               )
      )
    )
    
  )
  
))