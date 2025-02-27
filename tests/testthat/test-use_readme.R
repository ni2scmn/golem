test_that("generate_readme_tmpl works", {  res <- generate_readme_tmpl("my_pkg")
  expect_true(
    grepl("my_pkg", paste(res, collapse = " "))
  )
  expect_true(
    grepl("my_pkg::run_app()", paste(res, collapse = " "))
  )
  expect_true(
    grepl("covr::package_coverage", paste(res, collapse = " "))
  )
  expect_true(
    grepl("unloadNamespace", paste(res, collapse = " "))
  )
  expect_true(
    grepl("devtools::check", paste(res, collapse = " "))
  )
})


test_that("check_overwrite works", {
  expect_error(
    check_overwrite(FALSE, golem_sys("utils/empty_readme.Rmd")),
    "README.Rmd already exists. Set `overwrite = TRUE` to overwrite."
  )
})

test_that("use_readme_rmd works", {
  expect_true(
    use_readme_rmd(
      open = FALSE,
      overwrite = TRUE,
      pkg = getwd(),
      pkg_name = "rand_name"
    )
  )
  expect_true(
    file.exists("README.Rmd")
  )
  devtools:::build_readme()
})
