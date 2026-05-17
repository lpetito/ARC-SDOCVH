#' Get ZIP-level SDOH cluster data with optional burden labels
#'
#' Returns the package dataset `df_zip_cluster_kmeans_cv`, optionally adding
#' the substantive SDOH burden label used in the project analysis.
#'
#' @param labeled Logical. If `TRUE`, add `burden_sdoh`, where cluster 2 is
#'   Low, cluster 1 is Moderate, cluster 4 is High, and cluster 3 is Very High.
#'
#' @return A tibble containing ZIP-level SDOH variables and K-means cluster
#'   assignments.
#'
#' @export
#'
#' @examples
#' dat <- get_cluster_data()
#' head(dat)
#' table(dat$burden_sdoh)
get_cluster_data <- function(labeled = TRUE) {
  dat <- df_zip_cluster_kmeans_cv

  if (isTRUE(labeled)) {
    dat <- dat |>
      dplyr::mutate(
        burden_sdoh = factor(
          as.character(cluster_kmeans),
          levels = c("2", "1", "4", "3"),
          labels = c("Low", "Moderate", "High", "Very High")
        )
      )
  }

  dat
}
