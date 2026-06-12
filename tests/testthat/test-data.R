test_that("main dataset has expected structure", {
  expect_s3_class(df_zip_cluster_kmeans_cv, "data.frame")
  expect_true("ZIPCODE" %in% names(df_zip_cluster_kmeans_cv))
  expect_true("cluster_kmeans" %in% names(df_zip_cluster_kmeans_cv))
  expect_true("assigned_prob_kmeans" %in% names(df_zip_cluster_kmeans_cv))
  expect_equal(nrow(df_zip_cluster_kmeans_cv), 41117)
  expect_equal(ncol(df_zip_cluster_kmeans_cv), 26)
})

test_that("ZIPCODE is stored as five-character string", {
  expect_type(df_zip_cluster_kmeans_cv$ZIPCODE, "character")
  expect_true(all(nchar(df_zip_cluster_kmeans_cv$ZIPCODE) == 5))
})

test_that("cluster labels are created correctly", {
  dat <- get_cluster_data()

  expect_true("burden_sdoh" %in% names(dat))
  expect_equal(
    levels(dat$burden_sdoh),
    c(
      "Resourced",
      "Rural Isolated",
      "Urban Diverse",
      "Concentrated Disadvantage"
    )
  )
})

test_that("data dictionary covers all dataset columns", {
  expect_true(all(names(df_zip_cluster_kmeans_cv) %in% sdoh_zip_clusters_dictionary$variable))
})

test_that("pre-generated map file exists", {
  expect_true(file.exists(cluster_map_file()))
})

test_that("supplemental table file exists", {
  expect_true(file.exists(supplemental_table_file()))
})
