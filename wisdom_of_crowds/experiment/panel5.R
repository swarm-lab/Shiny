panel5 <- bsCollapsePanelNoHead(
  title = "NULL", id = "col5",
  
  div(class = "collapse_panel",
      
      h3("Thank you!"), 
      
      p("Your results have been successfully recorded. Thank you very much for your participation!"),
      
      p("If you are curious about the goal of this experiment, you can watch the video displayed below. It is a YouTube clip from a BBC documentary that gives a good overview of both the purpose and the history of the experiment. If the video does not display properly, here is the link to the original content on YouTube: ", a("http://youtu.be/iOucwX7Z1HU.", href = "http://youtu.be/iOucwX7Z1HU.", target = "_blank")),
      
      p("If you have additional questions, feel free to contact Simon Garnier at ", a("garnier@njit.edu.", href="mailto:garnier@njit.edu")),
      
      p(class = "divider")
  ),
  
  div(class = "button",
      
      HTML("<iframe width='640' height='480' align='center' src='//www.youtube.com/embed/iOucwX7Z1HU' frameborder='0' allowfullscreen></iframe>")
      
  ),
  
  div(class = "collapse_panel",
      
      p(class = "divider"),
      
      p("This app was created using", a("RStudio", href = "http://www.rstudio.com/", target = "_blank"), " and the", a("Shiny library.", href = "http://www.rstudio.com/shiny/", target = "_blank"), "The source code is avalaible on ", a("GitHub.", href = "https://github.com/swarm-lab/Shiny/tree/master/wisdom_of_crowds/experiment", target = "_blank"))
      
  )
)
