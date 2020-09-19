#' @export
timer <- function(input, output, session) {
  callModule(track, id = "track")
}
