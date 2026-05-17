#' ZIP-level cardiovascular-related SDOH K-means clusters
#'
#' A ZIP-level dataset containing social determinants of health variables and
#' final K-means cluster assignments from the cardiovascular-related SDOH
#' clustering analysis.
#'
#' The final K-means model used four clusters. The raw cluster labels are stored
#' in `cluster_kmeans`. For substantive interpretation, use the following mapping:
#' cluster 2 = Low burden, cluster 1 = Moderate burden, cluster 4 = High burden,
#' and cluster 3 = Very high burden.
#'
#' @format A tibble with 41,117 rows and 26 variables:
#' \describe{
#'   \item{ZIPCODE}{Five-digit ZIP code or ZCTA identifier, stored as character.}
#'   \item{ACS_PCT_FOREIGN_BORN_ZC}{Percentage of population that is foreign-born.}
#'   \item{ACS_PCT_BLACK_ZC}{Percentage of population reporting Black or African American race alone.}
#'   \item{ACS_PCT_ASIAN_ZC}{Percentage of population reporting Asian race alone.}
#'   \item{ACS_PCT_WHITE_ZC}{Percentage of population reporting White race alone.}
#'   \item{ACS_PCT_HISPANIC_ZC}{Percentage of population reporting Hispanic ethnicity.}
#'   \item{ACS_PCT_ENGLISH_ZC}{Percentage of population age 5 and over that only speaks English.}
#'   \item{ACS_PCT_OWNER_HU_ZC}{Percentage of occupied housing units that are owner-occupied.}
#'   \item{ACS_PCT_IN_COUNTY_MOVE_ZC}{Percentage of population with an in-county move.}
#'   \item{ACS_TOT_HU_ZC}{Total housing units.}
#'   \item{ACS_PCT_COMMT_15MIN_ZC}{Percentage of workers with commute time less than 15 minutes.}
#'   \item{ACS_PCT_COMMT_29MIN_ZC}{Percentage of workers with commute time between 15 and 29 minutes.}
#'   \item{POS_DIST_ED_ZP}{Distance-based access measure for emergency department proximity.}
#'   \item{ACS_PCT_MEDICAID_ANY_ZC}{Percentage of population with any Medicaid or means-tested public health insurance coverage.}
#'   \item{ACS_MEDIAN_HH_INC_ZC}{Median household income, inflation-adjusted to the data file year.}
#'   \item{ACS_PCT_LT_HS_ZC}{Percentage of population ages 25 and over with less than high school education.}
#'   \item{ACS_PCT_BACHELOR_DGR_ZC}{Percentage of population ages 25 and over with a bachelor's degree.}
#'   \item{ACS_PCT_HEALTH_INC_BELOW137_ZC}{Percentage of population under 1.37 of the poverty threshold, relevant for health insurance coverage.}
#'   \item{ACS_PCT_UNEMPLOY_ZC}{Percentage of civilian labor force unemployed, ages 16 and over.}
#'   \item{ACS_GINI_INDEX_ZC}{Gini index of income inequality.}
#'   \item{ACS_PCT_HH_PUB_ASSIST_ZC}{Percentage of households with public assistance income or food stamps/SNAP.}
#'   \item{ACS_PCT_HH_NO_INTERNET_ZC}{Percentage of households with no internet access.}
#'   \item{TOTALPRESVOTES}{Total presidential votes at the ZIP-code level.}
#'   \item{crime_rate_per_100000}{Crime rate per 100,000 population at the ZIP-code level.}
#'   \item{cluster_kmeans}{Final K-means cluster assignment. Factor with levels 1, 2, 3, and 4.}
#'   \item{assigned_prob_kmeans}{Distance-based assigned-cluster confidence score. This is not a model-based posterior probability.}
#' }
#'
#' @source Project-derived ZIP-level clustering dataset using ZIP/ZCTA-level
#' cardiovascular-related SDOH features.
#'
#' @examples
#' data <- get_cluster_data()
#' head(data)
"df_zip_cluster_kmeans_cv"


#' Data dictionary for ZIP-level cardiovascular-related SDOH clusters
#'
#' A machine-readable data dictionary for `df_zip_cluster_kmeans_cv`.
#'
#' @format A tibble with one row per variable:
#' \describe{
#'   \item{position}{Column position in `df_zip_cluster_kmeans_cv`.}
#'   \item{variable}{Variable name.}
#'   \item{type}{R class/type of the variable.}
#'   \item{description}{Human-readable variable description.}
#'   \item{source}{Source used for the variable description.}
#' }
#'
#' @source Generated from the SDOH 2020 ZIPCODE Layout sheet plus
#' project-specific manually documented variables.
#'
#' @examples
#' sdoh_zip_clusters_dictionary
"sdoh_zip_clusters_dictionary"
