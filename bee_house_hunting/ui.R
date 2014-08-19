library(shiny)

shinyUI(
  fluidPage(
    # CSS theme
    theme = "bootstrap.css",
    
    # Application title
    titlePanel("Collective nest-selection in honeybees"),
    
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        width = 3,
        
        sliderInput("duration", "Duration of the trial:",
                    min = 1, max = 200, value = 200, width = "100%"),
        sliderInput("scouts", "Number of scouts:",
                    min = 1, max = 200, value = 100, width = "100%"),
        sliderInput("quorum", "Quorum number:",
                    min = 1, max = 200, value = 25, width = "100%"),
        sliderInput("theta", "Time to introduce a 3rd nest:",
                    min = 1, max = 200, value = 100, width = "100%")
      ),
      
      # Main panel
      mainPanel(
        tabsetPanel(
          
          # Model panel
          tabPanel(
            title = "Model",
            
            wellPanel(plotOutput("ODE.plot")),
            fluidRow(
              column(4,
                     wellPanel(h5("Nest #1"),
                               sliderInput("gamma1", "Discovery rate:",
                                           min = 0, max = 10, value = 1.5, step = 0.1),
                               sliderInput("alpha1", "Desertion rate:",
                                           min = 0, max = 10, value = 1, step = 0.1),
                               sliderInput("rho1", "Recruitment rate:",
                                           min = 0, max = 10, value = 2, step = 0.1),
                               sliderInput("sigma1", "Deconversion rate:",
                                           min = 0, max = 10, value = 2, step = 0.1))
              ),
              column(4,
                     wellPanel(h5("Nest #2"),
                               sliderInput("gamma2", "Discovery rate:",
                                           min = 0, max = 10, value = 2, step = 0.1),
                               sliderInput("alpha2", "Desertion rate:",
                                           min = 0, max = 10, value = 1.5, step = 0.1),
                               sliderInput("rho2", "Recruitment rate:",
                                           min = 0, max = 10, value = 2, step = 0.1),
                               sliderInput("sigma2", "Deconversion rate:",
                                           min = 0, max = 10, value = 2, step = 0.1))
              ),
              column(4,
                     wellPanel(h5("Nest #3"),
                               sliderInput("gamma3", "Discovery rate:",
                                           min = 0, max = 10, value = 2, step = 0.1),
                               sliderInput("alpha3", "Desertion rate:",
                                           min = 0, max = 10, value = 1, step = 0.1),
                               sliderInput("rho3", "Recruitment rate:",
                                           min = 0, max = 10, value = 2, step = 0.1),
                               sliderInput("sigma3", "Deconversion rate:",
                                           min = 0, max = 10, value = 2, step = 0.1))
              )
            )
          ),
          
          # About panel
          tabPanel(
            title = "About",
            
            tags$hr(),
            
            p(strong("Author:"), " Simon Garnier"),
            
            p(strong("Twitter:"), a("@sjmgarnier", 
                                    href = "https://twitter.com/sjmgarnier",
                                    target = "_blank")),
            
            p(strong("Website:"), a("http://www.theswarmlab.com", 
                                    href = "http://www.theswarmlab.com",
                                    target = "_blank")),
            
            p(strong("Source code:"), 
              a("GitHub",
                href = "https://github.com/morpionZ/Shiny/tree/master/bee_house_hunting",
                target = "_blank")),
            
            p(strong("Created with:"), 
              a("RStudio",
                href = "http://www.rstudio.com/",
                target = "_blank"), 
              " and ",
              a("Shiny.",
                href = "http://shiny.rstudio.com",
                target = "_blank")),
            
            p(strong("License:"), 
              a("GPL v3",
                href = "http://www.gnu.org/copyleft/gpl.html",
                target = "_blank")),
            
            tags$hr(),
            
            h4("References:"),
            
            p(HTML('<ol>'),
              
              HTML('<li>'), "Seeley TD, Visscher PK, Schlegel T, Hogan PM, Franks NR, Marshall JAR (2012) Stop signals provide cross inhibition in collective decision-making by honeybee swarms. Science 335: 108–111.", 
              a("doi:10.1126/science.1210361.",
                href = "http://www.sciencemag.org/content/335/6064/108.full",
                target = "_blank"),
              
              HTML('<li>'), "Pais D, Hogan PM, Schlegel T, Franks NR, Leonard NE, Marshall JAR (2013) A Mechanism for Value-Sensitive Decision-Making. PLoS One 8: e73216.", 
              a("doi:10.1371/journal.pone.0073216.",
                href = "http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0073216",
                target = "_blank"),
              
              HTML('</ol>'))
          )
        )
      )
    )
  )
)
