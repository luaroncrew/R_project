library(shiny)

shinyUI(fluidPage(
  titlePanel("Première application"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("choix", "Abscisse", c("wt", "hp", "disp")),
      textOutput("resumeMpg"),
      textOutput("resumeVar"),
      tableOutput("tableau")
    ),
    mainPanel(
      plotOutput("nuage")
    )
  )
))

# Kirill salope