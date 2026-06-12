#' Get ZIP-level SDOH cluster data with optional cluster labels
#'
#' Returns the package dataset `df_zip_cluster_kmeans_cv`, optionally adding
#' the substantive SDOH cluster label used in the project analysis.
#'
#' @param labeled Logical. If `TRUE`, add `burden_sdoh`, where cluster 2 is
#'   Resourced, cluster 1 is Rural Isolated, cluster 4 is Urban Diverse, and
#'   cluster 3 is Concentrated Disadvantage.
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
          labels = c(
            "Resourced",
            "Rural Isolated",
            "Urban Diverse",
            "Concentrated Disadvantage"
          )
        )
      )
  }

  dat
}
