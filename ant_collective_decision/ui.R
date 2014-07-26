library(shiny);

shinyUI(
  fluidPage(
    # CSS theme
    theme = "bootstrap.css",
    
    # Application title
    titlePanel("Collective food source selection in ants"),
    
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        width = 3,
        
        sliderInput('N', 'Number of ants in the colony:', 
                    min=0, max=5000, value=1000, step=10, width = "100%"),
        
        sliderInput('t', 'Length of the experiment in seconds:', 
                    min=0, max=3600, value=1800, step=10, width = "100%")
      ),
      
      # Main panel
      mainPanel(
        tabsetPanel(
          
          # Model panel
          tabPanel(
            title = "Model",
            
            wellPanel(plotOutput('ODE.plot')),
            
            fluidRow(
              column(6,
                     wellPanel(
                       h5("Source #1"),
                       sliderInput('l1', 'Distance:', 
                                   min=0, max=100, value=20, step=1, width = "100%"),
                       sliderInput('q1', 'Quality:', 
                                   min=0, max=2, value=1, step=0.01, width = "100%"),
                       sliderInput('k1', 'Light intensity:', 
                                   min=0, max=100, value=20, step=1, width = "100%")
                     )
              ),
              
              column(6,
                     wellPanel(
                       h5("Source #2"),
                       sliderInput('l2', 'Distance:', 
                                   min=0, max=100, value=20, step=1, width = "100%"),
                       sliderInput('q2', 'Quality:', 
                                   min=0, max=2, value=1, step=0.01, width = "100%"),
                       sliderInput('k2', 'Light intensity:', 
                                   min=0, max=100, value=20, step=1, width = "100%")
                     )
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
              
              HTML('<li>'), "Seeley TD, Visscher PK, Schlegel T, Hogan PM, Franks NR, et al. (2012) Stop signals provide cross inhibition in collective decision-making by honeybee swarms. Science (80- ) 335: 108–111.", 
              a("doi:10.1126/science.1210361.",
                href = "http://www.sciencemag.org/content/335/6064/108.full",
                target = "_blank"),
              
              HTML('<li>'), "Pais D, Hogan PM, Schlegel T, Franks NR, Leonard NE, et al. (2013) A Mechanism for Value-Sensitive Decision-Making. PLoS One 8: e73216.", 
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




