#' Get file path to Supplemental Table 1
#'
#' Returns the installed file path for the Excel file containing Supplemental
#' Table 1, which describes the variables included in creation of the burden of
#' cardiovascular-related SDOH clusters.
#'
#' @return Character string giving the file path to `SuppTable1.xlsx`.
#'
#' @export
#'
#' @examples
#' supplemental_table_file()
supplemental_table_file <- function() {
  system.file(
    "extdata",
    "SuppTable1.xlsx",
    package = "ARCSDOCVH",
    mustWork = TRUE
  )
}
