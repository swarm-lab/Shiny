library(shiny)
library(shinyBS)
library(ggplot2)
library(RMySQL)

bsCollapsePanelNoHead <- function(title, ..., id = NULL, value = NULL, style = NULL) {
  content <- list(...)
  id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 1, 1e+06))))
  if (is.null(value)) {
    value = title
  }
  if (is.null(style)) {
    style = "default"
  }
  bsTag <- shiny::tags$div(
    class = paste0("panel panel-", style), 
    value = value, shiny::tags$div(
      class = "panel-heading", 
      role = "tab", id = paste0("heading_", id), 
      shiny::tags$h4(class = "panel-title", 
                     shiny::tags$a(`data-toggle` = "collapse", 
                                   href = paste0("#",  id)))), 
    shiny::tags$div(id = id, class = "panel-collapse collapse", 
                    role = "tabpanel", shiny::tags$div(class = "panel-body", content)))
  htmltools::attachDependencies(bsTag, shinyBS:::shinyBSDep)
}

source("panels/panel1.R", local = FALSE)
source("panels/panel2.R", local = FALSE)
source("panels/panel3.R", local = FALSE)
source("panels/panel4.R", local = FALSE)
source("panels/panel5.R", local = FALSE)

type <- NULL
