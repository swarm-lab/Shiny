# grid_sys <- function(time, init, parms) {
#   committed <- eightneighbours(init != 0)
#   total <- eightneighbours(init)
#   maximum <- eightneighbours(abs(init))
#   
#   p1 <- runif(nrow(init) * ncol(init)) <= (committed / 8)
#   p2 <- runif(nrow(init) * ncol(init)) <= ((total + maximum) / (2 * maximum))
#   
#   idx <- committed > 0
#   
#   init[(idx & p1 & p2)] <- 1 * parms$w1  
#   init[(idx & p1 & !p2)] <- -1 * parms$w2  
#   
#   init
# }

grid_sys <- function(time, init, parms) {
  o1 <- init
  o1[o1 < 0] <- 0
  
  o2 <- init
  o2[o2 > 0] <- 0
  
  p1 <- eightneighbors(o1) / 8
  p2 <- p1 - eightneighbors(o2) / 8
  
  r <- runif(nrow(init) * ncol(init))
  
  idx1 <- r <= p1
  idx2 <- r <= p2 & r > p1
  
  init[idx1] <- 1 * parms$w1
  init[idx2] <- -1 * parms$w2
  
  init
}






