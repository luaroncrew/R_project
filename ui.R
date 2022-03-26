
dataset <- read.csv('tel.csv', sep=";", dec=".")
dataset = dataset[,-1]
library(shinyWidgets)
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
          titlePanel("Selectionnez une variables pour analyser"),
          sidebarLayout(      
            sidebarPanel(
              helpText("Choisissez votre variable"),
              selectInput("choice", "Variable", 
                          choices=colnames(dataset)),
              hr()
            ),
            mainPanel(
              plotOutput("single_analysis_plot")  
            )
          )
      )
  )
)



