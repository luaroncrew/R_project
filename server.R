library(ggplot2)
library(shiny)
library(questionr)

dataset <- read.csv('tel.csv', sep=";", dec=".")
dataset$Tel <- as.factor(dataset$Tel)
dataset$Marque <- as.factor(dataset$Marque)
dataset$Tel <- as.factor(dataset$Tel)
dataset$Affichage <- as.factor(dataset$Affichage)
dataset$Type_coeur <- as.factor(dataset$Type_coeur)
dataset$RAM <- as.factor(dataset$RAM)

color_palette = c("#f9d5e5",
                  "#eeac99",
                  "#e06377",
                  "#c83349",
                  "#5b9aa0",
                  "#b8a9c9",
                  "#622569")

lien2Variables <- function(varname_1,varname_2){
  if (is.numeric(varname_1) & is.numeric(varname_2))
  {
    return(quantiQuanti(varname_1,varname_2))
  }
  
  if (!is.numeric(varname_1) & is.numeric(varname_2))
  {
    return(QualiQuanti(varname_1,varname_2))
  }
  
  if (is.numeric(varname_1) & !is.numeric(varname_2))
  {
    return(QualiQuanti(varname_1,varname_2))
  }
  
  if (!is.numeric(varname_1) & !is.numeric(varname_2))
  {
    return(qualiQuali(varname_1,varname_2))
  }
  
}


quantiQuanti <-function(variable1,variable2){
  return(plot(variable1, variable2, col = "#622569"))
  coeff_corel <- cor(x = variable1, y = variable2,use = "complete.obs")
}


qualiQuali <- function(varname_1,varname_2){
  a=colnames(dataset$varname1)
  return(barplot(table(varname_1, varname_2),
                 main=paste("Graphique en barre entre les variables 1 et 2"),
                 col = color_palette,
                 legend=TRUE
                 
        )
  )
}


QualiQuanti <- function(varname_1,varname_2){
  if (is.numeric(varname_1)){
    tmp=varname_1
    varname_1=varname_2
    varname_2=tmp
  }
  return(boxplot(varname_2 ~ varname_1))
  
}


get_single_plot <- function(chosen_variable){
  if (is.numeric(chosen_variable)){
    return(hist(chosen_variable, col = color_palette))
  }
  return(barplot(table(chosen_variable), col = color_palette))
  
}


function(input, output) {
  output$single_analysis_plot <- renderPlot({
    plot = get_single_plot(dataset[,input$choice])
  })
  output$telplot <- renderPlot({
    comparison_choice = lien2Variables(dataset[,input$varname_1],
                                       dataset[,input$varname_2])
  })
}
