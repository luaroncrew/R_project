
library(shiny)

dataset <- read.csv('tel.csv', sep=";", dec=".")

lien2Variables <- function(varname_1,varname_2){
  if (is.numeric(varname_1) & is.numeric(varname_2))
  {
    return(quantiQuanti(varname_1,varname_2))
  }
  if (!is.numeric(varname_1) & is.numeric(varname_2))
  {
    return(QualiQuanti(varname_1,varname_2))
  }
  if (!is.numeric(varname_1) & !is.numeric(varname_2))
  {
    return(qualiQuali(varname_1,varname_2))
  }
  
}


quantiQuanti <-function(variable1,variable2){
  return(ggplot(df, aes(x=variable1, y=variable2)) + geom_point())  
  coeff_corel <- cor(x = variable1, y = variable2,use = "complete.obs")
}


qualiQuali <- function(varname_1,varname_2){
  tab <- cprop(table(variable1,variable2))
  return(barplot(tab))
}


QualiQuanti <- function(varname_1,varname_2){
  return(boxplot(varname_1 ~ varname_2))
}



# Define a server for the Shiny app
function(input, output) {
  dataset <- read.csv('tel.csv', sep=";", dec=".")
  varname_1 = dataset[,input$varname_1]
  varname_2 = dataset[,input$varname_2]
  
  
  # Fill in the spot we created for a plot
  output$telplot <- renderPlot({
    comparison_choice = lien2Variables(varname_1, varname_2)
  })
}
