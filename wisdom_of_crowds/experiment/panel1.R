panel1 <- bsCollapsePanelNoHead(
  title = "NULL", id = "col1",
  
  div(class = "collapse_panel", 
      
      h3("Welcome!"), 
      
      p("And thank you for agreeing to participate in this experiment. It is part of the 2014",  a("'Collective Intelligence in Biological Systems' class (BIOL 337)", href = "http://biology.njit.edu/docs/biol_337-S14.pdf", target = "_blank"), "offered at the ", a("New Jersey Institute of Technology", href = "http://www.njit.edu", target = "_blank"), " (Newark NJ) by Professor ", a("Simon Garnier.", href = "http://www.theswarmlab.com", target = "_blank"), "This test is very short (5 minutes maximum) and your contribution will help the students grasp a fundamental concept of the class (more on that once you have completed the test)."),
      
      p("Before we start, you should know that this test is completely anonymous. No personal data or data that could help identify you will be requested or collected. Moreover the data that will be collected (4 numbers per participant, none of them being personal information) will never be used outside of the class (for instance, for research or commercial purposes)."),
      
      p("In the next step, you will be given instructions on how to complete the test. Please read them carefully before moving on to the next step. ", strong("Do not reload this page or click the 'Go back' button on your Internet browser. It will not work and will restart this application. "), "Once you have completed all the steps, you will be given access to a short documentary that will explain the main concepts behind this experiment."),
      
      p("Now, are you ready? If yes, click on the 'Start' button below.")
  ),
  
  div(class = "button",
      bsActionButton("start_button", "Start") 
  )
)
