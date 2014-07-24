# Required libraries
library(shiny)
library(deSolve)
library(ggplot2)


# ODE function
ode_sys <- function(t, y, parms) {
  yu <- 1 - sum(y)
  
  dy <- rep(0, 3)
  
  for (i in 1:3) {
    if (i == 3 & t < parms$theta) {
      dy[i] <- 0
    } else {
      idx <- which(1:length(dy) != i)
      
      dy[i] <-  yu * parms$gamma[i] + 
        y[i] * yu * parms$rho[i] - 
        y[i] * parms$alpha[i] - 
        y[i] * sum(parms$sigma[idx] * y[idx])
    }
  }
  
  list(dy)
}


# Shiny server call
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    parms <- list(gamma = c(input$gamma1, input$gamma2, input$gamma3),  # discovery rate
                  alpha = c(input$alpha1, input$alpha2, input$alpha3),  # spontaneous uncommitment 
                  rho = c(input$rho1, input$rho2, input$rho3),          # recruitment rate 
                  sigma = c(input$sigma1, input$sigma2, input$sigma3),  # conversion rate
                  theta = input$theta)                                  # time at which 3rd nest is introduced
    
    out <- lsoda(c(0, 0, 0), seq(0, input$duration, 0.1), ode_sys, parms)
    out[, 2:4] <- out[, 2:4] * input$scouts
    out <- as.data.frame(out)
    names(out) <- c("time", paste0("nest", 1:3))
    
    g <- ggplot(data = out,
                aes(x = time)) + 
      geom_path(aes(y = nest1), size = 1, color = "red") + 
      geom_path(aes(y = nest2), size = 1, color = "blue") +
      geom_path(aes(y = nest3), size = 1, color = "green") +
      geom_hline(yintercept = input$quorum, size = 1, linetype = 2) +
      theme_minimal(base_size = 14)
    
    print(g)
  })
  
})
