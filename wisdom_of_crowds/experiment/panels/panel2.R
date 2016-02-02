panel2 <- bsCollapsePanelNoHead(
  title = "NULL", id = "col2", value = "col2",
  
  div(class = "collapse_panel", 
      
      h3("Instructions"), 
      
      tags$hr(),
      
      p("The instructions are very simple. Once you are done reading them, click the button at the bottom of the page. A picture will be displayed that contains multiple dots distributed randomly and sometimes overlapping. The picture will remain on the screen for 10 seconds. During this time, try to count how many dots are in the picture."),
      
      p("After 10 seconds, the picture will disappear and a form will be displayed. In this form, you will be asked to answer two simple questions:"),
      
      HTML("<ol>
              <li>What is your estimate of the number of dots in the image?</li>
              <li>How confident are you in your estimate? (0: not confident at all; 10: absolutely certain)</li>
            </ol>"),
      
      p("Once you have answered these two questions, click the 'Submit' button at the bottom of the page. This will conclude the test and you will be given access to a video and some references explaining the main concepts behind this experiment."),
      
      p("Are you ready to start? If yes, click on the 'Ready!' button below. The test will start immediately.")      
  ),
  
  div(class = "button",
      actionButton("ready_button", "Ready!") 
  )
)
