library(tidyverse)
library(pwt10)

eci_data <- read_csv("data/rankings.csv")

pwt_data <- pwt10.01


# list.files("data",  pattern = "*.dta", full.names = TRUE) |>
#     map(\(x) haven::read_dta(x) |> write_csv(str_replace(pattern = ".dta", string = x, replacement = ".csv")))
location_data <- read_csv("data/location.csv")
hs_product <- read_csv("data/hs_product.csv")
sitc_product <- read_csv("data/sitc_product.csv")

# install.packages("devtools")
# devtools::install_github("WIDworld/wid-r-tool")

library(wid)
wid_data <- download_wid(
  indicators = "sptinc", # Shares of pre-tax national income
  areas = "all", # In the United States
  years = 2000:2022, # Time period: 2010-2015
  perc = "p90p100" # Top 10% only
)

wid_data |>
  ggplot(aes(x = year, y = value, color = country)) +
  geom_line()

head(eci_data)

eci_data %>%
  select(sitc_eci, sitc_eci_rank, hs_eci, hs_eci_rank, iso3c = code, year) %>%
  filter(iso3c %in% c("CHN", "BRA")) %>%
  ggplot(aes(x = year, y = hs_eci_rank, color = iso3c)) +
  geom_line()



pwt_data %>%
  select(year, iso3c = isocode, rgdpe, pop) %>%
  filter(iso3c %in% c("CHN", "BRA")) %>%
  mutate(
    rgdppc = rgdpe / pop,
    g_rgdppc = rgdppc / lag(rgdppc)
  ) %>%
  ggplot(aes(x = year, y = pop, color = iso3c)) +
  geom_line()

hdi <- read_csv("data/hdr_hdi.csv")

hdi %>%
  rename(iso3c = iso3) %>%
  select(-country) %>%
  pivot_longer(-c(iso3c, hdicode, region, hdi_rank_2021)) %>%
  # Maybe use just sub of the last 4 symbols, or just select numbers idk, maybe something simpler than regex yk
  separate_wider_delim(name, delim = regex("_(?=[^_]*$)"), names = c("index", "year")) |> 
  filter(index == "mys" & iso3c %in% c("CHN", "BRA")) %>%
  ggplot(aes(x = as.integer(year), y = value, color = iso3c)) +
  geom_line()
