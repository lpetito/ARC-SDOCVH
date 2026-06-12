#' Plot ZIP-level cardiovascular-related SDOH clusters
#'
#' Recreates the U.S. map of ZIP/ZCTA-level cardiovascular-related SDOH
#' clusters using 2020 Census ZCTA boundaries from `tigris`.
#'
#' @param data A data frame containing `ZIPCODE` and either `burden_sdoh` or
#'   `cluster_kmeans`. Defaults to the package dataset with cluster labels.
#' @param include_insets Logical. If `TRUE`, returns a mainland map with Alaska
#'   and Hawaii manually positioned as insets. If `FALSE`, returns a contiguous
#'   U.S. map only.
#'
#' @return A ggplot object.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' plot_cluster_map()
#' plot_cluster_map(include_insets = FALSE)
#' }
plot_cluster_map <- function(data = get_cluster_data(), include_insets = TRUE) {
  required_pkgs <- c("ggplot2", "sf", "tigris", "cowplot", "dplyr", "stringr")

  missing_pkgs <- required_pkgs[
    !vapply(required_pkgs, requireNamespace, quietly = TRUE, FUN.VALUE = logical(1))
  ]

  if (length(missing_pkgs) > 0) {
    stop(
      "The following packages are required for plotting: ",
      paste(missing_pkgs, collapse = ", "),
      call. = FALSE
    )
  }

  if (!"ZIPCODE" %in% names(data)) {
    stop("`data` must contain `ZIPCODE`.", call. = FALSE)
  }

  if (!"burden_sdoh" %in% names(data)) {
    if (!"cluster_kmeans" %in% names(data)) {
      stop("`data` must contain either `burden_sdoh` or `cluster_kmeans`.", call. = FALSE)
    }

    data <- data |>
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

  map_df <- data |>
    dplyr::mutate(
      ZIPCODE = stringr::str_pad(as.character(ZIPCODE), width = 5, side = "left", pad = "0"),
      burden_sdoh = factor(
        burden_sdoh,
        levels = c(
          "Resourced",
          "Rural Isolated",
          "Urban Diverse",
          "Concentrated Disadvantage"
        )
      )
    ) |>
    dplyr::select(ZIPCODE, burden_sdoh)

  options(tigris_use_cache = TRUE)

  zcta_sf <- tigris::zctas(year = 2020, cb = TRUE, class = "sf")

  zcta_id_col <- grep("^ZCTA5CE", names(zcta_sf), value = TRUE)[1]

  zcta_sf <- zcta_sf |>
    dplyr::transmute(
      ZIPCODE = .data[[zcta_id_col]],
      geometry = geometry
    )

  map_cluster_sf <- zcta_sf |>
    dplyr::inner_join(map_df, by = "ZIPCODE")

  state_sf <- tigris::states(cb = TRUE, year = 2020, class = "sf") |>
    dplyr::filter(!STUSPS %in% c("PR", "VI", "GU", "MP", "AS"))

  if (!isTRUE(include_insets)) {
    return(
      ggplot2::ggplot() +
        ggplot2::geom_sf(
          data = map_cluster_sf,
          ggplot2::aes(fill = burden_sdoh),
          color = NA
        ) +
        ggplot2::geom_sf(
          data = state_sf,
          fill = NA,
          color = "white",
          linewidth = 0.15
        ) +
        ggplot2::coord_sf(
          xlim = c(-125, -66),
          ylim = c(24, 50),
          expand = FALSE
        ) +
        ggplot2::labs(
          title = "Geographic distribution of cardiovascular-related SDOH clusters",
          subtitle = "Clusters assigned from ZIP-level SDOH features",
          fill = "CV-related SDOH cluster"
        ) +
        ggplot2::theme_minimal() +
        ggplot2::theme(
          axis.text = ggplot2::element_blank(),
          axis.title = ggplot2::element_blank(),
          panel.grid = ggplot2::element_blank(),
          legend.position = "bottom"
        )
    )
  }

  state_mainland <- state_sf |>
    dplyr::filter(!STUSPS %in% c("AK", "HI"))

  state_ak <- state_sf |>
    dplyr::filter(STUSPS == "AK")

  state_hi <- state_sf |>
    dplyr::filter(STUSPS == "HI")

  map_cluster_mainland <- sf::st_filter(map_cluster_sf, state_mainland)
  map_cluster_ak <- sf::st_filter(map_cluster_sf, state_ak)
  map_cluster_hi <- sf::st_filter(map_cluster_sf, state_hi)

  p_main <- ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = map_cluster_mainland,
      ggplot2::aes(fill = burden_sdoh),
      color = NA
    ) +
    ggplot2::geom_sf(
      data = state_mainland,
      fill = NA,
      color = "white",
      linewidth = 0.15
    ) +
    ggplot2::coord_sf(
      xlim = c(-125, -66),
      ylim = c(24, 50),
      expand = FALSE
    ) +
    ggplot2::labs(
      title = "Geographic distribution of cardiovascular-related SDOH clusters",
      subtitle = "Clusters assigned from ZIP-level SDOH features",
      fill = "CV-related SDOH cluster"
    ) +
    ggplot2::guides(fill = ggplot2::guide_legend(nrow = 1, byrow = TRUE)) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      legend.position = "bottom",
      legend.title = ggplot2::element_text(size = 11),
      legend.text = ggplot2::element_text(size = 10),
      legend.key.width = grid::unit(0.55, "cm"),
      legend.key.height = grid::unit(0.4, "cm"),
      plot.title = ggplot2::element_text(size = 15),
      plot.subtitle = ggplot2::element_text(size = 11)
    )

  p_ak <- ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = map_cluster_ak,
      ggplot2::aes(fill = burden_sdoh),
      color = NA
    ) +
    ggplot2::geom_sf(
      data = state_ak,
      fill = NA,
      color = "white",
      linewidth = 0.15
    ) +
    ggplot2::coord_sf(
      xlim = c(-170, -130),
      ylim = c(51, 72),
      expand = FALSE
    ) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "none",
      plot.background = ggplot2::element_rect(
        fill = "white",
        color = "grey70",
        linewidth = 0.3
      )
    )

  p_hi <- ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = map_cluster_hi,
      ggplot2::aes(fill = burden_sdoh),
      color = NA
    ) +
    ggplot2::geom_sf(
      data = state_hi,
      fill = NA,
      color = "white",
      linewidth = 0.15
    ) +
    ggplot2::coord_sf(
      xlim = c(-161, -154),
      ylim = c(18, 23),
      expand = FALSE
    ) +
    ggplot2::theme_void() +
    ggplot2::theme(
      legend.position = "none",
      plot.background = ggplot2::element_rect(
        fill = "white",
        color = "grey70",
        linewidth = 0.3
      )
    )

  cowplot::ggdraw() +
    cowplot::draw_plot(p_main, x = 0, y = 0, width = 1, height = 1) +
    cowplot::draw_plot(p_ak, x = 0.04, y = 0.17, width = 0.22, height = 0.18) +
    cowplot::draw_plot(p_hi, x = 0.07, y = 0.04, width = 0.16, height = 0.11)
}
