#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
 inputv <- reactive({
    switch(input$variable,
                   "Fertility" = swiss$Fertility,
                   "Agriculture" = swiss$Agriculture,
                   "Examination" = swiss$Examination,
                   "Education"= swiss$Education,
                   "Catholic"= swiss$Catholic)
    })
 
fit<-reactive({
    swiss$x<-inputv()
    lm(Infant.Mortality~x,data=swiss)
})
    
    output$plot <- renderPlot({
              swiss$x<-inputv()
             plot(swiss$x,swiss$Infant.Mortality,xlab="chosen variable",ylab="Infant Mortality")
             if(input$showModel){abline(fit(),col="red",lwd=2)}
    })
    output$model<-renderPrint({
       if (input$showModel) {summary(fit())}
    })
})
