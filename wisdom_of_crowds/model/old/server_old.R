library(shiny)
library(dplyr)
library(ggplot2)
source("ibm.R")

shinyServer(function(input, output, session) {  
  
  dat <- reactiveValues(tab = NULL)
  counter <- reactiveValues(count = -1)
  
  observe({
    if (counter$count != input$goButton) {
      counter$count <- input$goButton
      
      withProgress(message = "Simulating 1000 experiments", value = 0, {
        n <- 1000
        
        m1 <- replicate(n, woc(n = input$n, 
                               val = input$val,
                               error = input$error,
                               soc = 0))
        
        m2 <- replicate(n, woc(n = input$n, 
                               val = input$val,
                               error = input$error,
                               soc = input$soc))
        
        dat$tab <- data.frame(SOC = as.factor(rep(c("Control   ", "Experimental   "), each = n * 2)),
                              TYPE = rep(c("mean", "sd", "mean", "sd"), each = n),
                              VAL = c(apply(m1, 2, mean),
                                      apply(m1, 2, sd),
                                      apply(m2, 2, mean),
                                      apply(m2, 2, sd)))
      }) 
    }
  })
  
  output$IBM.plot1 <- renderPlot({
    g <- ggplot(filter(dat$tab, TYPE == "mean"),
                aes(x = VAL, color = SOC)) + 
      geom_density(size = 1) +
      theme_minimal(base_size = 18) + 
      theme(legend.position = "top", legend.title = element_blank()) +
      xlab("Group average") + ylab("Density") +
      scale_color_manual(values = c("tomato3", "dodgerblue3"))
    
    print(g)
  })
  
  output$IBM.plot2 <- renderPlot({
    g <- ggplot(filter(dat$tab, TYPE == "sd"),
                aes(x = VAL, color = SOC)) + 
      geom_density(size = 1) +
      theme_minimal(base_size = 18) + 
      theme(legend.position = "top", legend.title = element_blank()) +
      xlab("Group standard deviation") + ylab("Density") +
      scale_color_manual(values = c("tomato3", "dodgerblue3"))
    
    print(g)
  })
})
