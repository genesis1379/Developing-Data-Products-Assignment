library(shiny)

data(swiss)

fitLinearModel <- function(predictor) {
    f <- paste(names(swiss)[6], '~', predictor)
    lm(formula = f, data = swiss)
}

shinyServer(
    function(input, output) {
        output$predictor <- renderText(input$predictor)
        fit <- reactive(fitLinearModel(input$predictor))
        output$fit <- renderTable(fit())
        output$plot1 <- renderPlot(plot(fit(), which = 1))
        output$plot2 <- renderPlot(plot(fit(), which = 2))
        output$plot3 <- renderPlot(plot(fit(), which = 3))
        output$plot4 <- renderPlot(plot(fit(), which = 4))
        output$data <- renderTable(swiss)
    }
)