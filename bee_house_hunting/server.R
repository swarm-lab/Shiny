# Required libraries
require("shiny")
require("deSolve")
require("ggplot2")


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


# Parameters
parms <- list(gamma = c(1, 1, 1),         # discovery rate
              alpha = c(1/3, 1/3, 1/3),   # spontaneous uncommitment 
              rho = c(3, 3, 3),           # recruitment rate 
              sigma = c(10, 10, 10),      # conversion rate
              theta = 10)                 # time at which 3rd nest is introduced


# Shiny server call
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    out <- lsoda(c(0, 0, 0), 0:250 / 10, ode_sys, parms)
    out <- as.data.frame(out)
    names(out) <- c("time", paste0("nest", 1:3))
    
    g<- ggplot(data = out,
               aes(x = time)) + 
      geom_path(aes(y = nest1 * 100), size = 1, color = "red") + 
      geom_path(aes(y = nest2 * 100), size = 1, color = "blue") +
      geom_path(aes(y = nest3 * 100), size = 1, color = "green") +
      geom_hline(yintercept = 25, size = 1, linetype = 2) +
      theme_minimal(base_size = 14)
    
    print(g)
  })
  
})
