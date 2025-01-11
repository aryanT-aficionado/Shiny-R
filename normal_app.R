# Load the shiny package
library(shiny)

# Define the UI
ui = fluidPage(
  # Add a title
  titlePanel("Basic Shiny App: Interactive Plot"),
  
  # Add a sidebar layout
  sidebarLayout(
    # Sidebar panel for inputs
    sidebarPanel(
      # Add a slider input
      sliderInput(
        inputId = "num",        # ID to access in the server
        label = "Number of Points:",  # Label for the slider
        min = 10,               # Minimum value
        max = 100,              # Maximum value
        value = 30              # Default value
      )
    ),
    
    # Main panel for outputs
    mainPanel(
      # Add a plot output
      plotOutput(outputId = "scatterPlot")
    )
  )
)

# Define the server logic
server = function(input, output) {
  # Render the plot
  output$scatterPlot <- renderPlot({
    # Generate random points
    x <- rnorm(input$num)  # x-coordinates
    y <- rnorm(input$num)  # y-coordinates
    
    # Create a scatter plot
    plot(x, y, main = "Random Scatter Plot", xlab = "X-Axis", ylab = "Y-Axis")
  })
}

# Combine UI and server into a Shiny app
shinyApp(ui = ui, server = server)
