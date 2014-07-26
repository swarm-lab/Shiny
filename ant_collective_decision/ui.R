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
                                   min=0, max=100, value=25, step=1, width = "100%"),
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
                href = "https://github.com/morpionZ/Shiny/tree/master/ant_collective_decision",
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
              
              HTML('<li>'), "Goss S, Aron S, Deneubourg JL, Pasteels JM (1989) Self-organized shortcuts in the Argentine ant. Naturwissenschaften 76: 579–581.", 
              a("doi:10.1007/BF00462870.",
                href = "http://link.springer.com/article/10.1007%2FBF00462870",
                target = "_blank"),
              
              HTML('<li>'), "Beckers R, Deneubourg J, Goss S, Pasteels JM (1990) Collective decision making through food recruitment. Insectes Soc 37: 258–267.", 
              a("doi:10.1007/BF02224053.",
                href = "http://link.springer.com/article/10.1007%2FBF02224053",
                target = "_blank"),
              
              HTML('<li>'), "Dussutour A, Deneubourg J-L, Fourcassié V (2005) Amplification of individual preferences in a social context: the case of wall-following in ants. Proc Biol Sci 272: 705–714.", 
              a("doi:10.1098/rspb.2004.2990.",
                href = "http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0073216",
                target = "_blank"),
              
              HTML('</ol>'))
          )
        )
      )  
    )
  )
)




