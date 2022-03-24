
library(datasets)

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Analyse de téléphones"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      helpText("Choisissez vos variables"),
      selectInput("varname_1", "Variable 1", 
                  choices=colnames(WorldPhones)),
      selectInput("varname_2", "Variable 2", 
                  choices=colnames(WorldPhones)),
      hr()
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)
