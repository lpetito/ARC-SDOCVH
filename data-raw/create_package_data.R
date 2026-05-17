# Create package datasets.
# This script is for package maintainers only.
# It is not run when users install or load the package.

library(dplyr)
library(tibble)
library(readxl)
library(readr)
library(stringr)
library(usethis)

# Load the finalized ZIP-level K-means cluster dataset.
# This file should contain the object `df_zip_cluster_kmeans_cv`.
load("data-raw/kmeans_cluster_data.RData")

if (!exists("df_zip_cluster_kmeans_cv")) {
  stop("Object `df_zip_cluster_kmeans_cv` was not found in data-raw/kmeans_cluster_data.RData.")
}

# Standardize key variable types for package release.
df_zip_cluster_kmeans_cv <- df_zip_cluster_kmeans_cv %>%
  mutate(
    ZIPCODE = stringr::str_pad(as.character(ZIPCODE), width = 5, side = "left", pad = "0"),
    cluster_kmeans = factor(cluster_kmeans),
    assigned_prob_kmeans = as.numeric(assigned_prob_kmeans)
  )

# Read the SDOH layout sheet to generate the data dictionary.
layout_path <- "data-raw/SDOH_2020_ZIPCODE_1_0.xlsx"

layout_df <- readxl::read_excel(layout_path, sheet = "Layout")

layout_dictionary <- layout_df %>%
  transmute(
    variable = as.character(name),
    description_layout = as.character(label),
    source_layout = "SDOH_2020_ZIPCODE_1_0.xlsx, Layout sheet"
  ) %>%
  distinct(variable, .keep_all = TRUE)

# Add descriptions for project-specific variables not fully covered by the SDOH layout file.
manual_dictionary <- tibble::tribble(
  ~variable, ~description_manual, ~source_manual,

  "ZIPCODE",
  "Five-digit ZIP code or ZIP Code Tabulation Area identifier, stored as a character variable with leading zeros preserved.",
  "Package processing step",

  "TOTALPRESVOTES",
  "Total presidential votes at the ZIP-code level.",
  "Project-specific ZIP-level contextual source",

  "crime_rate_per_100000",
  "Crime rate per 100,000 population at the ZIP-code level.",
  "Project-specific ZIP-level contextual source",

  "cluster_kmeans",
  "Final K-means cluster assignment from standardized ZIP-level cardiovascular-related SDOH features. Factor levels are 1, 2, 3, and 4.",
  "Final project K-means model",

  "assigned_prob_kmeans",
  "Distance-based assigned-cluster confidence score from the final K-means model. This is not a model-based posterior probability.",
  "Final project K-means model"
)

var_types <- tibble::tibble(
  variable = names(df_zip_cluster_kmeans_cv),
  type = vapply(
    df_zip_cluster_kmeans_cv,
    function(x) paste(class(x), collapse = "/"),
    character(1)
  )
)

sdoh_zip_clusters_dictionary <- tibble::tibble(
  variable = names(df_zip_cluster_kmeans_cv),
  position = seq_along(names(df_zip_cluster_kmeans_cv))
) %>%
  left_join(var_types, by = "variable") %>%
  left_join(layout_dictionary, by = "variable") %>%
  left_join(manual_dictionary, by = "variable") %>%
  mutate(
    description = dplyr::coalesce(description_manual, description_layout, variable),
    source = dplyr::coalesce(source_manual, source_layout, "Project-derived variable")
  ) %>%
  select(
    position,
    variable,
    type,
    description,
    source
  )

# Save a CSV version of the data dictionary for users who want an external file.
dir.create("inst/extdata", recursive = TRUE, showWarnings = FALSE)

readr::write_csv(
  sdoh_zip_clusters_dictionary,
  "inst/extdata/sdoh_zip_clusters_dictionary.csv"
)

# Save package datasets into data/.
usethis::use_data(
  df_zip_cluster_kmeans_cv,
  sdoh_zip_clusters_dictionary,
  overwrite = TRUE,
  compress = "xz"
)
