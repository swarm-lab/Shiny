source("setup.R")
library(shiny)
library(shinyBS)
library(shinyFiles)
source("panel1.R")
source("panel2.R")
source("panel3.R")
source("panel4.R")
source("panel5.R")

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
