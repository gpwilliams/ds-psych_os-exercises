library(tidyverse)

# read data and make nice titles for factors
dat <- read_csv(here("01_data", "02_cleaned", "cleaned_data.csv")) |> 
  mutate(
    condition = str_to_title(str_replace(condition, "_", " "))
  )

# make plot

dat_plot <- ggplot(data = dat, mapping = aes(x = condition, y = feet)) +
  geom_boxplot() +
  labs(x = "Condition", y = "Estimated Feet") +
  theme_bw()

# save plot
ggsave(
  filename = here("02_plots", "condition_plot.png"),
  plot = dat_plot,
  width = 12,
  height = 8
)