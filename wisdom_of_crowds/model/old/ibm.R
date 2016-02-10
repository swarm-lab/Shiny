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
  require(msm)
  
  res <- rtnorm(n, mean = val, sd = val * error, lower = 0)
  
  soc <- sigmoid(0:n, m = (1 - soc) * n, b = 0.5)
  
  for (i in 2:n) {
    res[i] <- res[i] * (1 - soc[i]) + mean(res[1:(i-1)]) * soc[i]
  }
  
  res
}