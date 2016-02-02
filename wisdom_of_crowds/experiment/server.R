shinyServer(function(input, output, session) {
  
  react <- reactiveValues(count = 0)
  
  observe({
    if (input$start_button > 0) {
      updateCollapse(session, id = "collapse1", open = "col2", close = "col1")
    }
  })
  
  observe({
    if (input$ready_button > 0) {
      updateCollapse(session, id = "collapse1", open = "col3", close = "col2")
      isolate({react$count <- -1})
    }
  })
  
  output$plot_title <- renderUI({
    if (runif(1) > 0.5) {
      type <<- "naive"
      h4("Count the number of dots in the image below")
    } else {
      type <<- "informed"
      list(h4("Count the number of dots in the image below"),
           h5(paste("Average count from the last 10 users =", 
                    signif(162 + rnorm(1, sd = 3), 4)), class = "bold"))
    }
  })
  
  output$dots <- renderPlot({
    n <- 123
    dots <- data.frame(x = runif(n), y = runif(n))
    
    ggplot(dots, aes(x = x, y = y)) +
      geom_point(size = 5, alpha = 0.5) +
      labs(x = NULL, y = NULL) +
      theme(panel.grid.minor = element_blank(), 
            panel.grid.major = element_blank(),
            axis.title = element_blank(), 
            axis.text = element_blank(), 
            axis.ticks = element_blank())
  }, width = 400, height = 400)
  
  output$time_left <- renderText({
    invalidateLater(1000, session)
    isolate({
      react$count <- react$count + 1
      if (input$ready_button > 0 & input$submit_button < 1 & react$count > 10) {
        updateCollapse(session, id = "collapse1", open = "col4", close = "col3")
        react$count <- 10
      }
    })
    paste(10 - react$count, "seconds left")
  })
  
  observe({
    if (input$submit_button > 0) {
      updateCollapse(session, id = "collapse1", open = "col5", close = "col4")
      con <- dbConnect(MySQL(), default.file = normalizePath("mysql.cfg"))
      dbWriteTable(conn = con, name = "woc", append = TRUE, row.names = FALSE,
                   value = data.frame(type = type, count = input$count, conf = input$conf))
      dbDisconnect(con)
    }
  })
  
})
