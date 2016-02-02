shinyUI(
  navbarPage(
    title = "NJIT BIOL 337",
    theme = "bootstrap.css",
    fluid = FALSE,
    collapsible = TRUE,
    
    tabPanel("-",
             bsCollapse(panel1, panel2, panel3, panel4, panel5,
                        multiple = TRUE, id = "collapse1", open = "col1")
    ),
    
    tabPanel(tagList(tags$html("Powered by"),
                     tags$img(src = "white-rstudio-logo.png",
                              height = "20")),
             value = "RStudio",
             tags$head(tags$script(src = "actions.js"))
    )    
  )
)

