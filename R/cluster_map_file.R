#' Get file path to the pre-generated cluster map
#'
#' Returns the installed file path for the pre-generated PNG map of ZIP-level
#' cardiovascular-related SDOH clusters.
#'
#' @return Character string giving the file path to `cluster_map_us_inset.png`.
#'
#' @export
#'
#' @examples
#' cluster_map_file()
cluster_map_file <- function() {
  system.file(
    "extdata",
    "cluster_map_us_inset.png",
    package = "ARCSDOCVH",
    mustWork = TRUE
  )
}
