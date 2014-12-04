library(shiny)

data(swiss)

shinyUI(pageWithSidebar(
    headerPanel("Linear Regression on Swiss Data Set"),
    sidebarPanel(
        radioButtons('predictor', 'Choose Predictor:', names(swiss)[-6])
    ),
    mainPanel(
        tableOutput('data'),        
        tableOutput('fit'),
        plotOutput('plot1'),
        plotOutput('plot2'),
        plotOutput('plot3'),
        plotOutput('plot4')
    )
))