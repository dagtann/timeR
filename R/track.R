#' @export
track_ui <- function(id) {
  ns <- shiny::NS(id)

  shiny::tagList(
    shinydashboard::box(
      shiny::splitLayout(
        shiny::dateInput(
          inputId = ns("date"),
          label = "Date",
          value = base::Sys.Date()
        ),
        shinyTime::timeInput(
          inputId = ns("from"),
          label = "From",
          seconds = FALSE,
          minute.steps = 15L
        ),
        shinyTime::timeInput(
          inputId = ns("to"),
          label = "To",
          value = Sys.time(),
          seconds = FALSE,
          minute.steps = 15L
        ),
        shiny::selectizeInput(
          inputId = ns("project"),
          label = "Project",
          choices = c("Foo", "Bar")
        ),
        shiny::selectizeInput(
          inputId = ns("domain"),
          label = "Domain",
          choices = c("Foo", "Bar")
        ),
        shiny::textAreaInput(
          inputId = ns("remarks"),
          label = "Remarks",
          placeholder = "Description"
        ),
        shiny::actionButton(inputId = ns("add"), label = NULL, icon = shiny::icon("save")),
        cellWidths = rep("14%", 7)
      ),
      title = NULL,
      footer = NULL,
      width = 12
    )
  )
}

#' @export
track <- function(input, output, session) {
  # Do awsome stuff
}
