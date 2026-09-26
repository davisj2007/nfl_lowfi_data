# One team's ratings over time, both models
library(tidyverse)

h <- read_csv("data/history/lowfi_history.csv")

h %>%
  filter(team == "KC", season >= 2019) %>%
  mutate(t = row_number()) %>%
  ggplot(aes(t, net_rating, color = source)) +
  geom_line() +
  labs(x = "week, 2019 on", y = "LOWFI/1 net rating",
       caption = "retrodiction until the live season; see LOWFI_CAVEATS.md")
