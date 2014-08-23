library(shiny)
library(shinyIncubator)

shinyUI(
  fluidPage(
    # CSS theme
    theme = "bootstrap.css",
    
    # Progress bar
    progressInit(),
    
    # Application title
    titlePanel("Wisdom of Crowds"),
    
    # Sidebar
    sidebarLayout(
      sidebarPanel(
        width = 3, 
        
        sliderInput("n", "Number of tested people", 
                    min = 1, max = 1000, value = 100, width = "100%"),
        
        sliderInput("val", "Number of gumballs in the jar", 
                    min = 1, max = 1000,value = 200, width = "100%"),
        
        sliderInput("error", "% error of individual estimates", 
                    min = 0, max = 1, value = 0.2, width = "100%"),
        
        sliderInput("soc", "Intensity of social influence", 
                    min = 0, max = 1, value = 0, width = "100%")
      ),
      
      # Main panel
      mainPanel(
        tabsetPanel(
          
          # Model panel
          tabPanel(
            title = "Simulations",
            
            fluidRow(
              column(6,
                     plotOutput("IBM.plot1")),
              
              column(6,
                     plotOutput("IBM.plot2"))
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
                href = "https://github.com/morpionZ/Shiny/tree/master/wisdom_of_crowds/model",
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
              
              HTML('<li>'), "Lorenz J, Rauhut H, Schweitzer F, Helbing D (2011) How social influence can undermine the wisdom of crowd effect. Proc Natl Acad Sci USA 108: 9020–9025.", 
              a("doi:10.1073/pnas.1008636108.",
                href = "http://www.pnas.org/content/108/22/9020",
                target = "_blank"),
              
              HTML('<li>'), "Moussaïd M, Kämmer JE, Analytis PP, Neth H (2013) Social influence and the collective dynamics of opinion formation. PLoS One 8: e78433.", 
              a("doi:10.1371/journal.pone.0078433.",
                href = "http://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0078433",
                target = "_blank"),
              
              HTML('</ol>'))
          )
        )
      )
    )
  )
)

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
#             h4("Experiment"),
#             
#             p(style="text-align:justify",
#               "In this (virtual) experiment, (virtual) people are asked to estimate the number of (virtual) gumballs placed into a (virtual) transparent jar. This experiment is repeated 100 times with a given number of people (set by 'Number of tested people')."), 
#             
#             p(style="text-align:justify", 
#               "The number of gumballs in the jar is set by 'Number of gumballs in the jar'. Each individual has a certain normally distributed error in its estimate of the number of gumballs (set by 'Percentage error of individual estimates')."), 
#             
#             p(style="text-align:justify", 
#               "Finally, individuals can be influenced by the estimates of the people before them. The strength of this social influence is set by 'Intensity of social influence'. A value of zero means that each individual makes its estimate independently from previously made estimates. A value of one means that each individuals bases its estimate mostly on previously made estimates."),
#             
#             tags$hr(),
#             
#             h4("Figures"),
#             
#             p(style="text-align:justify",
#               "The ", strong("left figure"), " represents the distribution (histogram + density plot) of individual estimates in one replicate of the experiment. You can see the distribution for each replicate by sliding the cursor of the 'Show replicate #' slider at the bottom of the side bar, or by clicking the play button at the bottom right corner of the sidebar. The vertical, dashed red line represents the real number of gumballs that individuals are asked to estimate. The vertical, dashed dark bue line represents the average estimate of the population."),
#             
#             p(style="text-align:justify",
#               "The ", strong("right figure"), " represents the distribution (histogram + density plot) of the average population error (i.e., difference between the average estimate of individuals in each experimental replicates and the real value). The vertical, dashed red line represents the average individual error. The vertical, dashed dark bue line represents the average error of the population. ")
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
#             href = "https://github.com/morpionZ/Teaching/tree/master/Wisdom%20of%20crowds/model",
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
#         p(strong("More about the 'Wisdom of Crowds' concept:")),
#         
#         p(HTML('<ul>'),
#           HTML('<li>'), strong("Wikipedia: "), 
#           a("http://en.wikipedia.org/wiki/Wisdom_of_the_crowd",
#             href = "http://en.wikipedia.org/wiki/Wisdom_of_the_crowd",
#             target = "_blank"), HTML('</li>'),
#           
#           HTML('<li>'), strong("Amazon: "),
#           HTML('<ul>'), 
#           HTML('<li>'), a("'The Wisdom of Crowds'",
#                           href = "http://www.amazon.com/The-Wisdom-Crowds-James-Surowiecki/dp/0385721706",
#                           target = "_blank"), 
#           " by James Surowiecki", HTML('</li>'),
#           
#           HTML('<li>'), a("'Critical Mass: How One Thing Leads to Another'",
#                           href = "http://www.amazon.com/Critical-Mass-Thing-Leads-Another/dp/0374530416/ref=sr_1_3?s=books&ie=UTF8&qid=1391283741&sr=1-3&keywords=critical+mass",
#                           target = "_blank"), 
#           " by Philip Ball", HTML('</li>'),
#           
#           HTML('<li>'), a("'Collective Animal Behavior'",
#                           href = "http://www.amazon.com/Collective-Animal-Behavior-David-Sumpter/dp/0691148430/ref=sr_1_1?s=books&ie=UTF8&qid=1391283801&sr=1-1&keywords=collective+animal+behavior",
#                           target = "_blank"), 
#           " by David Sumpter", HTML('</li>'),
#           HTML('</ul>'),
#           
#           HTML('<li>'), strong("YouTube: "), 
#           a("www.youtube.com/iOucwX7Z1HU",
#             href = "www.youtube.com/embed/iOucwX7Z1HU",
#             target = "_blank"), HTML('</li>'),
#           HTML('</ul>')),
#         
#         HTML("<div class='video-container'>
#                 <iframe width='640' height='480' align='center' src='//www.youtube.com/embed/iOucwX7Z1HU' frameborder='0' allowfullscreen></iframe>
#              </div>")
#       )
#     )
#   )
# ))
# 
# 
