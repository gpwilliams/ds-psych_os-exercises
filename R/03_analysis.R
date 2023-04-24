library(tidyverse)
library(broom)

dat <- read_csv(here("01_data", "02_cleaned", "cleaned_data.csv"))

# check assumptions
qqnorm(dat$feet) # normality of residuals [not met]

# conduct test
mod <- wilcox.test(feet ~ condition, data = dat)

write_csv(
  broom::tidy(mod),
  here("03_analysis", "wilcox_test.csv")
)

# make descriptives
descriptives <- dat |> 
  group_by(condition) |> 
  summarise(
    feet_mean = mean(feet),
    feet_sd = sd(feet),
    n = n()
  )

write_csv(
  descriptives,
  here("03_analysis", "descriptives.csv")
)
