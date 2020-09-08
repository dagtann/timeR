timer_ui <- shinydashboard::dashboardPage(
  shinydashboard::dashboardHeader(
    title = shiny::tags[["strong"]]("timeR")
  ),
  shinydashboard::dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Add", icon = shiny::icon(name = "pencil")),
      menuItem(text = "Assess", icon = shiny::icon(name = "chart-bar")),
      menuItem(text = "Settings", icon = shiny::icon(name = "cogs"))
    )
  ),
  shinydashboard::dashboardBody()
)
