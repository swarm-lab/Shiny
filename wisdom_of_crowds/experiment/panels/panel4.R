panel4 <- bsCollapsePanelNoHead(
  title = "NULL", id = "col4", value = "col4",
  
  div(class = "collapse_panel", 
      h3("Fill out the form below"),
      
      tags$hr(),
      
      numericInput("count", "What is your estimate of the number of dots in the image?", "", width = "50%"),
      
      p(class = "divider"),
      
      sliderInput("conf", "How confident are you in your estimate? (0: not confident at all; 10: absolutely certain)", min = 0, max = 10, value = 5, step = 1, width = "50%"),
      
      p(class = "divider")
  ),
  
  div(class = "button",
      actionButton("submit_button", "Submit") 
  )
)
