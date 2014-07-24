library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Collective nest-selection in honeybees"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("duration", "Duration of the trial:",
                  min = 1, max = 200, value = 200, width = "100%"),
      sliderInput("scouts", "Number of scouts:",
                  min = 1, max = 200, value = 100, width = "100%"),
      sliderInput("quorum", "Quorum number:",
                  min = 1, max = 200, value = 25, width = "100%"),
      sliderInput("theta", "Time to introduce the 3rd nest:",
                  min = 1, max = 200, value = 100, width = "100%")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      fluidRow(
        column(4,
               h5("Nest #1"),
               sliderInput("gamma1", "Discovery rate:",
                           min = 0, max = 10, value = 1.5, step = 0.1),
               sliderInput("alpha1", "Desertion rate:",
                           min = 0, max = 10, value = 1, step = 0.1),
               sliderInput("rho1", "Recruitment rate:",
                           min = 0, max = 10, value = 2, step = 0.1),
               sliderInput("sigma1", "Conversion rate:",
                           min = 0, max = 10, value = 2, step = 0.1)
        ),
        column(4,
               h5("Nest #2"),
               sliderInput("gamma2", "Discovery rate:",
                           min = 0, max = 10, value = 2, step = 0.1),
               sliderInput("alpha2", "Desertion rate:",
                           min = 0, max = 10, value = 1.5, step = 0.1),
               sliderInput("rho2", "Recruitment rate:",
                           min = 0, max = 10, value = 2, step = 0.1),
               sliderInput("sigma2", "Conversion rate:",
                           min = 0, max = 10, value = 2, step = 0.1)
        ),
        column(4,
               h5("Nest #3"),
               sliderInput("gamma3", "Discovery rate:",
                           min = 0, max = 10, value = 2, step = 0.1),
               sliderInput("alpha3", "Desertion rate:",
                           min = 0, max = 10, value = 1, step = 0.1),
               sliderInput("rho3", "Recruitment rate:",
                           min = 0, max = 10, value = 2, step = 0.1),
               sliderInput("sigma3", "Conversion rate:",
                           min = 0, max = 10, value = 2, step = 0.1)
        )
      )
    )
  )
))
