library(shiny)
library(ggplot2)

data(father.son)

shinyServer(
    function(input, output) {
        output$plot <- renderPlot({
            g <- ggplot(father.son, aes(sheight, fheight))
            g + geom_point() + geom_smooth(method = "lm", formula = y ~ x)
        })
    }
)