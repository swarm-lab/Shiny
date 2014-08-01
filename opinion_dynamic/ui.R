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







# sidebarPanel3 <- function (...) 
# {
#   div(class = "span3", tags$form(class = "well", ...))
# }
# 
# shinyUI(pageWithSidebar(
#   
#   # Application title
#   headerPanel("NJIT BIOL 337 - 'Opinion dynamics' model"),
#   
#   sidebarPanel3(    
#     includeCSS("custom.css"),
#     
#     sliderInput(
#       "time", 
#       "Timestep", 
#       min = 0,
#       max = 260, 
#       value = 0,
#       animate = animationOptions(interval = 500, loop = FALSE)),
#     
#     checkboxInput(
#       "twoOpinions", 
#       "Add a competing opinion?",
#       value = FALSE),
#     
#     conditionalPanel(
#       condition = "input.twoOpinions",
#       sliderInput(
#         "influence", 
#         "Relative influence of competing opinion", 
#         min = 0.8,
#         max = 1.2, 
#         value = 1,
#         step = 0.01,
#         ticks = FALSE)),
#     
#     p(align='center',
#       actionButton(
#         "rerun", 
#         "Re-run experiment"))
#   ),
#   
#   # Show a plot of the generated distribution
#   mainPanel(
#     tabsetPanel(
#       tabPanel(
#         title = "Simulations",
#         div(class="row-fluid",
#             div(class = "span6", plotOutput("plot1")),
#             
#             div(class = "span6", plotOutput("plot2")) 
#         ),
#         
#         div(
#           class = "row-fluid",
#           wellPanel(
#             h4("Instructions"),
#             
#             p(style="text-align:justify",
#               "This web app presents a simplified model of the way opinions spread in a population."),
#             
#             p(style="text-align:justify",
#               "The ", strong("left figure"), " is a 25 x 25 regular grid in which each square represents a person (625 people total). The color of each square represents the opinion of each person: white = no opinion; red = opinion #1; blue = opinion #2 (when the ", strong("'Add a competing opinion?'"), " box is ticked)."),
#             
#             p(style="text-align:justify",
#               "The ", strong("right figure"), " represents the number of people who have adopted opinion #1 (red line) or opinion #2 (blue line; when the ", strong("'Add a competing opinion?'"), " box is ticked) as a function of time. The vertical gray bar shows the current ", strong("'Timestep'"), " at which the left figure is at."),
#             
#             p(style="text-align:justify",
#               "At the beginning of an experiment -", strong("'Timestep' = 0"), "-, all people have no opinion (white squares), except for one person if the ", strong("'Add a competing opinion?'"), " box is left unticked, or for two people if the ", strong("'Add a competing opinion?'"), " box is ticked (in which case one person has opinion #1 and the other one opinion #2). As time passes -", strong("'Timestep' > 0"), "-, each colored square (person with an opinion) tries to convince adjacent squares to adopt its color (*i.e.*, to adopt its opinion). The more squares of a given color (same opinion) try to convince a square to adopt their color, the more likely the targeted square is to do so."),
#             
#             p(style="text-align:justify",
#               "Finally, when the ", strong("'Add a competing opinion?'"), " box is ticked, a new slider appears called 'Relative influence of competing opinion'. This slider controls the relative influence of opinion #2 versus opinion #1. When the value of the slider is at 1, both opinions have the same relative influence: if a square is surrounded by the same number of red and blue squares, it has a same probability of turning red or blue. If the value of the slider is superior to 1 (respectively inferior), then opinion #2 (respectively #1) has a stronger influence than opinion #1 (respectively #2): if a square is surrounded by the same number of red and blue squares, it has more chances to turn blue (respectively red) than red (respectively blue).")
#           )
#         )
#       ),
#       
#       tabPanel(
#         title = "About",
#         
#         p(strong("Author:"), 
#           " Simon Garnier - ", 
#           a("@sjmgarnier", 
#             href = "https://twitter.com/sjmgarnier",
#             target = "_blank"),
#           " - ",
#           a("www.theswarmlab.com", 
#             href = "http://www.theswarmlab.com",
#             target = "_blank")),
#         
#         p(strong("Class: "), 
#           a("BIOL 337 - 'Collective Intelligence in Biological Systems'",
#             href = "http://biology.njit.edu/docs/biol_337-S14.pdf",
#             target = "_blank")),
#         
#         p(strong("At: "), 
#           a("New Jersey Institute of Technology",
#             href = "http://www.njit.edu",
#             target = "_blank")),
#         
#         p(strong("Source code: "), 
#           a("GitHub",
#             href = "https://github.com/morpionZ/Teaching/tree/master/Opinion%20dynamics",
#             target = "_blank")),
#         
#         p("Created with ", 
#           a("RStudio",
#             href = "http://www.rstudio.com/",
#             target = "_blank"), 
#           " and ",
#           a("Shiny.",
#             href = "http://www.rstudio.com/shiny/",
#             target = "_blank")),
#         
#         tags$hr(),
#         
#         p(strong("Recommended links:")),
#         
#         p(HTML('<ul>'),
#           HTML('<li>'), a("Physicists model how we form opinions",
#                           href = "http://phys.org/news127385810.html",
#                           target = "_blank"), HTML('</li>'),
#           HTML('<li>'), a("Minority Rules: Scientists Discover Tipping Point for the Spread of Ideas",
#                           href = "http://news.rpi.edu/luwakkey/2902",
#                           target = "_blank"), HTML('</li>'),
#           HTML('<li>'), p(a("Why Internet Rumors Spread So Quickly",
#                             href = "http://www.youtube.com/watch?v=g8GKJ1GwFvg",
#                             target = "_blank"), 
#                           "(link to video below)"), HTML('</li>'),
#           HTML('</ul>')),
#         
#         HTML("<div class='video-container'>
#                 <iframe width='640' height='480' align='center' src='//www.youtube.com/embed/g8GKJ1GwFvg' frameborder='0' allowfullscreen></iframe>
#              </div>")
#       )
#     )
#   )
# ))


