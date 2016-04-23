library(shiny)

# houselist
houselist = c("mesham","rishabam","mithunam","katakam","simham","kanni",
              "thula","vrichikam","dhanusu","makaram","kumbam","meenam")


shinyUI(fluidPage(
  headerPanel("Yogi Calculation"),
  sidebarLayout(
    sidebarPanel(
      selectInput("yogitype","Yogi or Avayogi",choices = c("Yogi","Avayogi"),selected = "Yogi"),
      h3("Suryan Longitude"),
      selectInput("suryan_house","House",choices = houselist,selected = "mesham"),
      fluidRow(
        column(6,
               numericInput("suryan_long_deg","degrees",0,min = 0, max = 360)
               ),
        column(6,
               numericInput("suryan_long_min","min",0,min = 0, max = 60)
               )
      ),

      h3("Chandran Longitude"),
      selectInput("chandran_house","House",choices = houselist,selected = "mesham"),
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