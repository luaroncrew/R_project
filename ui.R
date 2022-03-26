
dataset <- read.csv('tel.csv', sep=";", dec=".")
dataset = dataset[,-1]
library(shinyWidgets)
library(shinydashboard)
# Use a fluid Bootstrap layout
fluidPage(
  
  #style params
  setBackgroundColor(
    color = "#d6d4e0",
  ),
  titlePanel("Analyse de telephones"),
    tabsetPanel(
      tabPanel("Croisement de variables",
          titlePanel("Selectionnez des variables pour en faire croisement"),
          sidebarLayout(      
            sidebarPanel(
              helpText("Choisissez vos variables"),
                selectInput("varname_1", "Variable 1", 
                             choices=colnames(dataset)),
                selectInput("varname_2", "Variable 2", 
                             choices=colnames(dataset)),
                 hr()
               ),
               mainPanel(
                 plotOutput("telplot")  
               )
             )
      ),
      tabPanel("Analyse d'une variable ",
          titlePanel("Selectionnez une variable pour analyser en appuiyant sur le bouton"),
          
          br(),
          dropdownButton(
            selectInput(inputId = 'choice',
                        label = 'Variable X',
                        choices = names(dataset)),
            
            
            circle = FALSE, status = "info",
            icon = icon("bars"), width = "300px",
            
            tooltip = tooltipOptions(title = "Cliquez pour choisir !")
          ),
          br(),
            mainPanel(
              plotOutput("single_analysis_plot")  
            )
          )
      )
  )




