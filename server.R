
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(GGally)
data(happy)

shinyServer(function(input, output) {

  output$oselection <- renderPrint({input$selection})

  output$newPlot <- renderPlot({
     counts <- table(happy$happy, happy[,input$selection])
     barplot(counts, main=paste("Happiness by", input$selection),
              xlab=input$selection, col=c("green","blue","navy"),
              legend = rownames(counts))
     
  })

})
