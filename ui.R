
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(GGally)
data(happy)

shinyUI(fluidPage(

  # Application title
  titlePanel("Happiness Data"),

  # Select an option to plot happiness
  sidebarLayout(
    sidebarPanel(
        radioButtons("selection", "Selection:",
                     names(happy)[-c(1,2)]),
        
        tags$br(),
        tags$br(),
        strong('Selections:'),
        p('year: years; 1972–2004'),
        p('age: age in years; 18–89'),
        p('sex: sex; female, male'),
        p('marital: marital status; married, never married, divorced, widowed, separated'),
        p('degree: highest education; lt high school, high school, junior college, bachelor, graduate'),
        p('finrela: relative financial status; far above, above average, average, below average, far below'),
        p('health: health; excellent, good, fair, poor'),
        p('wtsall: probability weight; 0.43–6.43')
 
    ),

    # Show a plot of the generated distribution
    mainPanel(
    
        h2('HAPPINESS DATA'),
        p('This data extract is taken from Hadley Wickham\'s "productplots" package. The data is a small sample of variables related to happiness from the General Social Survey (GSS). The GSS is a yearly cross-sectional survey of Americans, run from 1972. Data is combined for 25 years to yield 51,020 observations, and of the over 5,000 variables, nine is selected related to happiness.'),
        tags$br(),
        h4('Directions'),
        p('Please select a variable from the selection part and see the plot below.'),
        strong('You selected'),
        verbatimTextOutput("oselection"),
        plotOutput("newPlot")
    )
  )
))
