# server.R


library(ggplot2)
data(iris)

shinyServer(function(input, output) {

  formulaText <- reactive({
    paste(input$variable, " ~ Species" )
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Plot the chosen variable against Species and only 
  # include outliers if requested
  output$plot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = iris,
            outline = input$outliers, 
            xlab="Species", ylab=input$variable, 
            col="green")
  })
  output$stats <- renderTable({
    varAsString <-  paste("iris$", input$variable, sep="")
    varvalues <- eval(parse(text = varAsString))
    names <- c("Var: ", "Mean: ", "SD: ", "Min: ", "Max: ")
    vals <- c(input$variable, mean(varvalues), sd(varvalues), min(varvalues), max(varvalues))
    stats <- data.frame(names, vals)
    stats
    }, include.rownames=FALSE, include.colnames=FALSE)
  
})