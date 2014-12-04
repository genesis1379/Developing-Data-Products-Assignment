library(shiny)

data(swiss)

fitLinearModel <- function(predictors) {
    f <- paste(names(swiss)[6], '~', paste(predictors, collapse = ' + '))
    glm(formula = f, data = swiss)
}

plotModel <- function(fit, n) {
    plot(fit, which = n)
}

summarizeModel <- function(fit) {
    summary(fit)
}

shinyServer(
    function(input, output) {
        output$data <- renderTable(head(swiss, 7))        
        fit <- reactive(fitLinearModel(input$predictors))
        output$fit <- renderPrint(summarizeModel(fit()))
        output$plot1 <- renderPlot(plotModel(fit(), 1))
        output$plot2 <- renderPlot(plotModel(fit(), 2))
        output$plot3 <- renderPlot(plotModel(fit(), 3))
    }
)