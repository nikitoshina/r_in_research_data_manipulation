library(testthat)
library(dplyr)

packageVersion("dplyr")

# Column order is different
expect_equal(tibble(x = 1, y = 2),
             tibble(y = 2, x = 1))


# renv::install("dplyr@0.8.4")
# renv::install("dplyr@1.1.1")
