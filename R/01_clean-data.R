library(tidyverse)
library(here) 
library(janitor)

dat <- read_csv(here("01_data", "01_raw", "jk_data.csv")) |> 
  clean_names() |>
  mutate(
    age = case_when(
      age == "twenty" ~ "20",
      TRUE ~ age
    ),
    age = as.numeric(age),
    sex = str_to_lower(sex),
    sex = case_when(
      sex == "m" ~ "male",
      sex == "f" ~ "female",
      TRUE ~ sex
    ),
    condition = case_when(
      condition == "small" ~ "small_anchor",
      condition == "LARGE" ~ "large_anchor",
      condition == "BIG" ~ "large_anchor",
      TRUE ~ condition
    )
  )

write_csv(dat, here("01_data", "02_cleaned", "cleaned_data.csv"))
