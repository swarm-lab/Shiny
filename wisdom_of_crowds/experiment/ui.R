library(shiny)
library(shinyBS)

shinyUI(
  bootstrapPage(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    
    bsNavBar("nav", brand = "NJIT - BIOL 337", fixed = FALSE),
    
    bsCollapse(multiple = TRUE, id = "collapse1", open = "col1",
               panel1,
               panel2,
               panel3,
               panel4,
               panel5
    )
  )
)
