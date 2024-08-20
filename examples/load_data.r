# Read dta file
library(haven)
eci_data <- read_dta("data/eci_rankings.dta")


# Read xlsx file
library(readxl)
hdr_data <- read_xlsx("data/HDR23-24.xlsx",sheet = "HDI_clean")
hdr_data <- janitor::clean_names(hdr_data) 

# Data from a package
library(pwt10)
head(pwt10.01)


# API wrapper call
library(wid)
wid_data <- download_wid(
  # Shares of pre-tax national income
  indicators = "sptinc", 
  areas = "all", # In the All Areas
  years = 2000:2022, # Time period: 2000-2022
  perc = "p90p100" # Top 10% only
)

# Save into csv
library(readr)
write_csv(eci_data, "data/csvs/eci_data.csv")
write_csv(hdr_data, "data/csvs/hdr_data.csv")
write_csv(pwt10.01, "data/csvs/pwt_data.csv")
write_csv(wid_data, "data/csvs/wid_data.csv")


# Read from csv
eci_data <- read_csv("data/csvs/eci_data.csv")
hdr_data <- read_csv("data/csvs/hdr_data.csv")
pwt10.01 <- read_csv("data/csvs/pwt_data.csv")
wid_data <- read_csv("data/csvs/wid_data.csv")



# R Data Structure
# Base option: readRDS()
write_rds(list("wid" = wid_data,
               "pwt" = pwt_data),
          "data/list_wid_pwt.rds")
(list_wid_pwt <- read_rds("data/list_wid_pwt.rds"))


# R Data file
save(eci_data, hdr_data, file = "data/eci_hdr.RData")
rm(eci_data, hdr_data)
c("eci_data", "hdr_data") %in% ls()
eci_data

load("eci_hdr.RData")
c("eci_data", "hdr_data") %in% ls()
hdr_data
eci_data

# R Data file
save.image("data/workspace_image.RData") 
rm(list = ls())
ls()

load("data/workspace_image.RData")
ls()

# API Call
library(httr2)
request(
  "https://archive-api.open-meteo.com/v1/archive"
) |>
  req_url_query(
    latitude = 37.773972,
    longitude = -122.431297,
    start_date = "2001-01-31",
    end_date = "2001-01-31",
    hourly = "temperature_2m",
    timezone= "America/Los_Angeles"
  ) |>
  req_perform()

response <- .Last.value
print(response)

# Parse and view the response content
content <- resp_body_json(response)
print(content)

time_temp <- tibble::enframe(content$hourly) |>
  tidyr::pivot_wider(names_from = name,
                     values_from = value) |>
  tidyr::unnest(cols = c(time, temperature_2m)) |>
  tidyr::unnest(cols = c(time, temperature_2m)) |>
  dplyr::mutate(
    time = as.POSIXct(
      time,
      format = "%Y-%m-%dT%H:%M",
      tz = "America/Los_Angeles"
    ),
  )

library(ggplot2)
time_temp |>
  ggplot(aes(x = time, y = temperature_2m)) +
  geom_line(linewidth=2) +
  scale_x_datetime(
    date_labels = "%H",
    date_breaks = "1 hour"
  ) +
  labs(title = "Hourly temperatures in 2001-01-31") +
  theme_minimal()

