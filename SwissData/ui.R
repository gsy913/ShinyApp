#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(

    titlePanel("Exploring relationship between infant mortality and various factors in swiss Dataset"),

    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "variable",
                        label = "Choose a variable:",
                        choices = c("Fertility", "Agriculture", "Examination","Education","Catholic")),
            checkboxInput("showModel","Show/hide model",value=T)
        ),

        mainPanel(
            h3("Scatter plot of chosen variables:"),
            plotOutput("plot"),
            h3("Model Details:"),
            textOutput("model")
        )
    )
))
