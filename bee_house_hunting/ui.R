
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Collective nest-selection in honeybees"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("duration", "Duration of the trial:",
                  min = 1, max = 1000, value = 25, width = "100%"),
      sliderInput("scouts", "Number of scouts:",
                  min = 1, max = 200, value = 100, width = "100%"),
      sliderInput("quorum", "Quorum number:",
                  min = 1, max = 200, value = 25, width = "100%"),
      sliderInput("three", "Time to introduce the 3rd nest:",
                  min = 1, max = 200, value = 100, width = "100%")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      fluidRow(
        column(4,
               sliderInput("a", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("b", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("c", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("d", "Number of observations:",
                           min = 1, max = 1000, value = 500)
        ),
        column(4,
               sliderInput("a", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("b", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("c", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("d", "Number of observations:",
                           min = 1, max = 1000, value = 500)
        ),
        column(4,
               sliderInput("a", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("b", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("c", "Number of observations:",
                           min = 1, max = 1000, value = 500),
               sliderInput("d", "Number of observations:",
                           min = 1, max = 1000, value = 500)
        )
      )
    )
  )
))
