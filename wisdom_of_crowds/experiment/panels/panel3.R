panel3 <- bsCollapsePanelNoHead(
  title = "NULL", id = "col3", value = "col3",

  div(class = "button",
      uiOutput("plot_title"),
      
      plotOutput("dots", width = "400px", inline = TRUE),
      
      h4(textOutput("time_left"))
  )
)
