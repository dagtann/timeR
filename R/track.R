#' @export
track_ui <- function(id) {
  ns <- shiny::NS(id)
  fluidPage(
    shinydashboard::box(
      shiny::splitLayout(
        shiny::dateInput(
          inputId = ns("date"),
          label = "Date",
          value = base::Sys.Date()
        ),
        mapply(
          shinyTime::timeInput,
          inputId = c(ns("from"), ns("to")),
          label = c("From", "To"),
          value = c(Sys.time(), Sys.time() + 300),
          MoreArgs = list(seconds = FALSE, minute.steps = 15L),
          SIMPLIFY = FALSE
        ),
        cellWidths = c("33%", "33%", "33%")
      ),
      mapply(
        shiny::selectizeInput,
        inputId = c(ns("project"), ns("domain")),
        label = c("Project", "Domain"),
        MoreArgs = list(choices = c("Foo", "Bar")),
        SIMPLIFY = FALSE
      ),
      shiny::textAreaInput(
        inputId = ns("remarks"),
        label = "Remarks",
        placeholder = "Description"
      ),
      shiny::actionButton(
        inputId = ns("save"),
        label = NULL,
        icon = shiny::icon("save")
      ),
      title = "Add New Entry",
      footer = NULL,
      width = 12
    ),
    shinydashboard::box(
      shiny::dataTableOutput(outputId = ns("activityLog")),
      title = "Activity Log",
      footer = NULL,
      width = 12
    )
  )
}

#' @export
track <- function(input, output, session) {
  activity_data <- data.frame(
          Date = FALSE,
          From = FALSE,
          To = FALSE,
          Project = FALSE,
          Domain = FALSE,
          Remarks = FALSE
        )[0, ]

  output$activityLog <- renderDataTable(
    expr = {
      input$save

      activity_data
    }
  )

  shiny::updateSelectizeInput(
    session = session,
    inputId = "project",
    choices = names(subject_entries)
  )

  observeEvent(
    eventExpr = input$project,
    handlerExpr = updateSelectizeInput(
      session = session,
      inputId = "domain",
      choices = subject_entries[[input$project]]
    )
  )

  observeEvent(
    eventExpr = input$save,
    handlerExpr = {
      # browser()
      activity_data <<- rbind(
        activity_data,
        data.frame(
          Date = input$date,
          From = input$from,
          To = input$to,
          Project = input$project,
          Domain = input$domain,
          Remarks = input$remarks
        )
      )
    }
  )

  # output$activityLog <- shiny::renderDataTable(expr = activity_data())
}
