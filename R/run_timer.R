#' export
run_timer <- function(ui = timer_ui, server = timer) {
  shiny::shinyApp(ui = ui, server = server)
}
