library(shiny)

shinyUI(fluidPage(
  titlePanel("Exploring The Iris Dataset"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose a dimension of the flower. Its range of values 
will be displayed
against the three iris species in the dataset
               and statistics of that variable will be shown."),
    
      selectInput("variable", "Variable:",
                  list("Sepal Length" = "Sepal.Length", 
                       "Sepal Width" = "Sepal.Width", 
                       "Petal Length" = "Petal.Length",
                       "Petal Width" = "Petal.Width")),
      
      checkboxInput("outliers", "Show outliers", FALSE),
      
      h4("Variable Statistics:"),
      tableOutput("stats")
      ),
    
    mainPanel(plotOutput("plot"))
  )
))