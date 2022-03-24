
dataset <- read.csv('tel.csv', sep=";", dec=".")

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Analyse de téléphones"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with put fields
    sidebarPanel(
      helpText("Choisissez vos variables"),
      selectInput("varname_1", "Variable 1", 
                  choices=colnames(dataset)),
      selectInput("varname_2", "Variable 2", 
                  choices=colnames(dataset)),
      hr()
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("telplot")  
    )
    
  )
)
