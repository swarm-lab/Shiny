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

#' **Document title:** Custom functions for "Wisdom of Crowds" app
#' 
#' **Date:** January 15, 2014
#' 
#' **Author:** Simon Garnier (http://www.theswarmlab.com / @sjmgarnier)
#' 
#' **Description:** This script contains all custom functions (non server and
#' non gui) for the "Wisdom of Crowds" app
#' 
#' Document generated with RStudio ([www.rstudio.com](http://www.rstudio.com)).
#' 

# Load libraries
require("compiler")

# Enable Just-In-Time compiler system-wide
enableJIT(3)

# Functions
sigmoid <- function(x, a = 0, k = 1, b = 0.1, m = 100, v = 1, q = 1) {
  # Generalized sigmoid function. 
  #
  # Args:
  #   x: A vector of values for which to compute the generalized sigmoid function.
  #   a: Lower asymptote (default: 0).
  #   k: Upper asymptote (default: 1).
  #   b: Growth rate (default: 0.1).
  #   v: Affects near which asymptote maximum growth occurs (default: 1).
  #   q: Partly determines point of inflection along y axis (defaul: 1).
  #   m: Point of inflection along x axis (default: 100).
  #
  # Returns:
  #   A vector of the same length as x.
  
  s <- a + (k - a) / ((1 + q * exp(-b * (x - m)))^(1 / v))
  s0 <- a + (k - a) / ((1 + q * exp(-b * (0 - m)))^(1 / v))
  (s - s0) / diff(c(s0, 1)) * diff(c(0, 1))
}

woc <- function(n = 100, val = 200, error = 0.1, soc = 1) {
  require("msm")
  
  res <- rep(NA, n)
  
  res[1] <- rtnorm(1, mean = val, sd = val * error, lower = 0)
  
  for (i in 2:n) {
    crowd <- mean(res[1:(i-1)])
    w <- sigmoid(x = i-1, m = 10 / soc)
    new.mean <- val * (1 - w) + crowd * w
    new.sd <- val * error * (1 - w)
    res[i] <- rtnorm(1, mean = new.mean, sd = new.sd, lower = 0)
  }
  
  res
}


