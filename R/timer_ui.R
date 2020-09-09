#' @export
#' @import shinydashboard
timer_ui <- function() {
  shinydashboard::dashboardPage(
    shinydashboard::dashboardHeader(
      title = shiny::tags[["strong"]]("timeR")
    ),
    shinydashboard::dashboardSidebar(
      shinydashboard::sidebarMenu(
        shinydashboard::menuItem(text = "Track", tabName = "track", icon = shiny::icon(name = "pencil")),
        shinydashboard::menuItem(text = "Assess", tabName = "assess", icon = shiny::icon(name = "chart-bar")),
        shinydashboard::menuItem(text = "Settings", tabName = "settings", icon = shiny::icon(name = "cogs"))
      )
    ),
    shinydashboard::dashboardBody(
      shinydashboard::tabItems(
        shinydashboard::tabItem(
          tabName = "track",
          shiny::h2("Track Your Latest Activity"),
          track_ui(id = "track")
        ),
        shinydashboard::tabItem(tabName = "assess", shiny::h2("Analyse Your Latest Activities")),
        shinydashboard::tabItem(tabName = "settings", shiny::h2("Configure timeR"))
      )
    )
  )
}
