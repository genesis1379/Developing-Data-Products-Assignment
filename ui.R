library(shiny)

data(swiss)

shinyUI (
    fluidPage (
        title = "Linear Regression on Swiss Data Set",
        h1("Linear Regression on Swiss Data Set"),
        fluidRow (
            column (
                5,
                h3('Data Set Sample'),
                p (
                    paste (
                        'The swiss data set contains a standardized fertility measure',
                        'and socio-economic indicators for each of 47 French-speaking',
                        'provinces of Switzerland at about 1888 as well as the infant',
                        'mortality rate of these provinces. All variables but the',
                        'fertility give the proportions of the population.'
                    )
                ),
                tableOutput('data'),
                p (
                    paste (
                        'Please choose at least one predictor with which you want',
                        'to predict the infant mortality rate. With your selection',
                        'a generalized linear model is fitted whose summary is',
                        'displayed to the right. The model fit is also visualized',
                        'in three different plots which you can find below.'
                    )
                )
            ),
            column (
                5,
                offset = 1,
                verbatimTextOutput('fit')
            )
        ),
        fluidRow (
            column (
                2,
                checkboxGroupInput (
                    "predictors",
                    "Choose predictor(s):",
                    names(swiss)[-6],
                    names(swiss)[1]
                )
            ),
            column (
                3,
                plotOutput('plot1')
            ),
            column (
                3,
                plotOutput('plot2')
            ),
            column (
                3,
                plotOutput('plot3')
            )
        )
    )
)