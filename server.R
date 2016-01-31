
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
     for (i in 1:length(input$selection)) {
     counts <- table(happy$happy, happy[,input$selection[i]])
     barplot(counts, main=paste("Happiness by", input$selection[i]),
              xlab=input$selection[i], col=c("green","blue","navy"),
              legend = rownames(counts))
     
     }

  })

})
