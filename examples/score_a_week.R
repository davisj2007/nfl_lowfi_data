# Score a week's forecasts yourself
#
# Points per game = 25 - 100 * (P - R)^2, where P is the home win probability
# and R is 1 for a home win, 0 for a loss, 0.5 for a tie.
library(tidyverse)

wk <- "data/weekly/2026/wk02"
bets <- read_csv(file.path(wk, "bets.csv"))
m0   <- read_csv(file.path(wk, "games_m0.csv"))
results <- nflreadr::load_schedules(2026) %>% select(game_id, result)

bets %>%
  left_join(m0 %>% select(game_id, p_home_m0), by = "game_id") %>%
  inner_join(results, by = "game_id") %>%
  filter(!is.na(result)) %>%
  mutate(r = case_when(result > 0 ~ 1, result < 0 ~ 0, TRUE ~ 0.5)) %>%
  summarise(games = n(),
            lowfi1 = sum(25 - 100 * (model_p_home - r)^2),
            lowfi0 = sum(25 - 100 * (p_home_m0 - r)^2),
            market = sum(25 - 100 * (mkt_p_home - r)^2))
