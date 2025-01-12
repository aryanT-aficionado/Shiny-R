library(shiny)
library(shinythemes)

ui = fluidPage(
  theme = shinytheme("cosmo"),
  
  # Add Title
  titlePanel("Linear Regression Plot"),
  
  # Add sidebar layout
  sidebarLayout(
    # Sidebar panel for input
    sidebarPanel(
      # Add Slider input
      sliderInput(
        inputId = "num",        # ID to access in the server
        label = "Number of Points:",  # Label for the slider
        min = 10,               # Minimum value
        max = 100,              # Maximum value
        value = 30,             # Default value
        step = 2
      )
    ),
    
    # Main Panel for output
    mainPanel(
      # Add a plot output
      plotOutput(outputId = "regressionPlot")
    )
  )
)

server = function(input, output){
  # Render the plot
  output$regressionPlot = renderPlot({
    set.seed(123)
    
    x = rnorm(input$num)
    y = 2 * x + rnorm(input$num, sd = 0.5)
    
    model = lm(y ~ x)
    #  Create a scatter plot with the regression line
    plot(x, y, main = "Scatter Plot with Regression Line", xlab = "X-Axis", ylab = "Y-Axis", pch = 19, col = "blue")
    abline(model, col = "red", lwd = 2)  # Add the regression line
    
    # Display the equation of the line
    intercept <- round(coef(model)[1], 2)
    slope <- round(coef(model)[2], 2)
    legend("topleft", legend = paste0("y = ", slope, "x + ", intercept), col = "red", lwd = 2, bty = "n")
  })
}

shinyApp(ui = ui, server = server)
