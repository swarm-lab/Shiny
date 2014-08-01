library(shiny)

shinyUI(
  fluidPage(
    # CSS theme
    theme = "css/bootstrap.css",
    
    # Application title
    titlePanel("Opinion dynamics"),
    
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        width = 3,
        
        sliderInput("max.time", "Duration of the trial:",
                    min = 1, max = 500, value = 200, width = "100%"),
        
        sliderInput("w1", "Strength of opinion 1:",
                    min = 0, max = 1, value = 0.25, step = 0.01, width = "100%"),
        
        sliderInput("w2", "Strength of opinion 2:",
                    min = 0, max = 1, value = 0.25, step = 0.01, width = "100%"),
        
        p(align='center',
          actionButton("rerun", "Re-run experiment"))
      ),
      
      mainPanel(
        tabsetPanel(
          tabPanel(
            title = "Simulations",
            
            wellPanel(plotOutput("plot")),
            
            wellPanel(uiOutput("timeline"))
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
                href = "https://github.com/morpionZ/Shiny/tree/master/opinion_dynamic",
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
            
            h4("Recommended links:"),
            
            p(HTML('<ol>'),
              HTML('<li>'), a("Physicists model how we form opinions",
                              href = "http://phys.org/news127385810.html",
                              target = "_blank"), HTML('</li>'),
              HTML('<li>'), a("Minority Rules: Scientists Discover Tipping Point for the Spread of Ideas",
                              href = "http://news.rpi.edu/luwakkey/2902",
                              target = "_blank"), HTML('</li>'),
              HTML('<li>'), p(a("Why Internet Rumors Spread So Quickly",
                                href = "http://www.youtube.com/watch?v=g8GKJ1GwFvg",
                                target = "_blank"), 
                              "(link to video below)"), HTML('</li>'),
              HTML('</ol>')),
            
            HTML("<div class='video-container'>
                  <iframe width='640' height='480' align='center' src='//www.youtube.com/embed/g8GKJ1GwFvg' frameborder='0' allowfullscreen></iframe>
                  </div>")
          )
        )
      )
    )
  )
)

