library(shiny)

shinyServer(function(input, output) {
  output$nuage <- renderPlot({
    plot(mtcars$mpg ~ mtcars[,input$choix], main = "Consommation")
  })
  
  output$resumeMpg <- renderText({
    paste("Moyenne mpg :", mean(mtcars$mpg, na.rm = T))
  })
  output$resumeVar <- renderText({
    paste("Moyenne", input$choix, ":", mean(mtcars[,input$choix], na.rm = T))
  })
  
  output$tableau <- renderTable({
    sub = subset(mtcars, select = c("mpg", input$choix))
    sapply(sub, summary)
  })
})


quantiQuanti <-function(variable1,variable2){
  print(ggplot(df, aes(x=variable1, y=variable2)) + geom_point())  
  coeff_corel <- cor(x = variable1, y = variable2,use = "complete.obs")
}

  
qualiQuali <- function(varname_1,varname_2){
  tab <- cprop(table(variable1,variable2))
  print(barplot(tab))
}
  

QualiQuanti <- function(varname_1,varname_2){
  return(boxplot(varname_1 ~ varname_2))
}
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
