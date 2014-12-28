if (!require("shinyBS")) install.packages("shinyBS")

bsCollapsePanelNoHead <- function (title, ..., id = NULL, value = NULL) {
  content <- list(...)
  if (is.null(id)) 
    id <- paste0("cpanel", sprintf("%07i", as.integer(stats::runif(1, 
                                                                   1, 1e+06))))
  if (is.null(value)) {
    value = title
  }
  tags$div(class = "accordion-group", 
           tags$div(), 
           tags$div(class = "accordion-body collapse", 
                    id = id, `data-value` = value, 
                    tags$div(class = "accordion-inner", 
                             content)
           )
  )
}
