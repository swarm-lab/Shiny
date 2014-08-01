#' Copyright 2014 Simon Garnier (http://www.theswarmlab.com / @sjmgarnier)
#' 
#' This script is free software: you can redistribute it and/or modify it under
#' the terms of the GNU General Public License as published by the Free Software
#' Foundation, either version 2 of the License, or (at your option) any later
#' version.
#' 
#' This script is distributed in the hope that it will be useful, but WITHOUT
#' ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#' FOR A PARTICULAR PURPOSE.
#' 
#' See the GNU General Public License for more details.
#' 
#' You should have received a copy of the GNU General Public License along with
#' this script. If not, see http://www.gnu.org/licenses/.
#' 

#' **Document title:** Custom functions for "Opinion dynamic" app
#' 
#' **Date:** February 3, 2014
#' 
#' **Author:** Simon Garnier (http://www.theswarmlab.com / @sjmgarnier)
#' 
#' **Description:** This script contains all custom functions (non server and
#' non gui) for the "Opinion dynamic" app
#' 
#' Document generated with RStudio ([www.rstudio.com](http://www.rstudio.com)).
#' 

# 
opinionDyn <- function(n.seeds = 1, two.opinions = FALSE, weighting = 1,
                       nrow = 25, ncol = 25, times = 1:25) {
  require("simecol")
  
  if ((!two.opinions & n.seeds > (nrow * ncol)) | (two.opinions & n.seeds > (0.5 * nrow * ncol))) {
    stop("Too many seeds. The number of seeds should be at most nrow x ncol if two.opinions is FALSE, or 0.5 * nrow * ncol if two.opinions is TRUE.")
  }
  
  init <- matrix(0, nrow = nrow, ncol = ncol)
  idx <- sample(1:(nrow * ncol), n.seeds * (1 + two.opinions), FALSE)
  if (two.opinions) {
    init[idx[1:(length(idx) / 2)]] <- 1
    init[idx[(1 + (length(idx) / 2)):length(idx)]] <- -1 * weighting
  } else {
    init[idx] <- 1
  }
  
  # Build gridModel
  m1 <- new(
    "gridModel",
    main = function(time, init, parms) {
      committed <- eightneighbours(init != 0)
      total <- eightneighbours(init)
      maximum <- eightneighbours(abs(init))
      p1 <- runif(nrow(init) * ncol(init)) <= (committed / 8)
      p2 <- runif(nrow(init) * ncol(init)) <= ((total + maximum) / (2 * maximum))
      idx <- committed > 0
      init[(idx & p1 & p2)] <- 1
      init[(idx & p1 & !p2)] <- -1 * parms$weighting
      return(init)
    },
    parms = list(weighting = weighting),
    times = times,
    init = init,
    solver = "iteration"
  )
  
  sim(m1)
}




