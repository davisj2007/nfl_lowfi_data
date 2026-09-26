# LOWFI data dictionary

Generated from the data, so it cannot drift. Weekly files are described from the
latest released week; every week has the same files, though an early week may lack
a column added later.

## `bets.csv`

The week's games: LOWFI/1 line and win probability, the market line and price, cover, push and stake.

| column | type | description |
|---|---|---|
| `game_id` | character | nflverse game identifier. JOIN KEY to nflverse schedules and play-by-play. |
| `season` | numeric | NFL season |
| `week` | numeric | week of the season |
| `team_home` | character | home team |
| `game_played` | logical | **UNDOCUMENTED** |
| `result` | logical | final home margin |
| `spread_line` | numeric | market spread as home margin (+ = home favored), as on file when written |
| `total_line` | numeric | **UNDOCUMENTED** |
| `div_game` | numeric | **UNDOCUMENTED** |
| `off_rating_home` | numeric | **UNDOCUMENTED** |
| `def_rating_home` | numeric | **UNDOCUMENTED** |
| `net_rating_home` | numeric | **UNDOCUMENTED** |
| `off_se_home` | numeric | **UNDOCUMENTED** |
| `def_se_home` | numeric | **UNDOCUMENTED** |
| `games_played_home` | numeric | **UNDOCUMENTED** |
| `team_away` | character | away team |
| `off_rating_away` | numeric | **UNDOCUMENTED** |
| `def_rating_away` | numeric | **UNDOCUMENTED** |
| `net_rating_away` | numeric | **UNDOCUMENTED** |
| `off_se_away` | numeric | **UNDOCUMENTED** |
| `def_se_away` | numeric | **UNDOCUMENTED** |
| `games_played_away` | numeric | **UNDOCUMENTED** |
| `strength_diff` | numeric | **UNDOCUMENTED** |
| `spread_pred` | numeric | LOWFI/1 expected home margin (+ = home favored) |
| `gameday` | Date | date of the game |
| `gametime` | hms | **UNDOCUMENTED** |
| `home_moneyline` | numeric | home moneyline, American odds |
| `away_moneyline` | numeric | away moneyline, American odds |
| `home_spread_odds` | numeric | **UNDOCUMENTED** |
| `away_spread_odds` | numeric | **UNDOCUMENTED** |
| `p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |
| `p_cover_home` | numeric | LOWFI/1 probability the home team beats the spread |
| `p_push` | numeric | LOWFI/1 probability the game lands exactly on the spread |
| `model_p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |
| `model_p_away` | numeric | **UNDOCUMENTED** |
| `p_cover_away` | numeric | **UNDOCUMENTED** |
| `mkt_p_home` | numeric | market home win probability, de-vigged from the moneylines |
| `mkt_hold_ml` | numeric | **UNDOCUMENTED** |
| `mkt_p_cover_home` | numeric | **UNDOCUMENTED** |
| `mkt_hold_spread` | numeric | **UNDOCUMENTED** |
| `ev_ml_home` | numeric | **UNDOCUMENTED** |
| `ev_ml_away` | numeric | **UNDOCUMENTED** |
| `ev_sp_home` | numeric | **UNDOCUMENTED** |
| `ev_sp_away` | numeric | **UNDOCUMENTED** |
| `units_ml_home` | numeric | **UNDOCUMENTED** |
| `units_ml_away` | numeric | **UNDOCUMENTED** |
| `units_sp_home` | numeric | LOWFI/1 quarter-Kelly stake on the home side, units per 100. Zero means pass. Not advice. |
| `units_sp_away` | numeric | LOWFI/1 quarter-Kelly stake on the away side, units per 100. Zero means pass. Not advice. |
| `edge_points` | numeric | **UNDOCUMENTED** |
| `edge_prob` | numeric | **UNDOCUMENTED** |

## `games_m0.csv`

The week's games: LOWFI/0 implied line and win probability.

| column | type | description |
|---|---|---|
| `game_id` | character | nflverse game identifier. JOIN KEY to nflverse schedules and play-by-play. |
| `team_home` | character | home team |
| `team_away` | character | away team |
| `m0_margin` | numeric | LOWFI/0 win probability mapped to a home margin. A calibration, not a points forecast. |
| `p_home_m0` | numeric | LOWFI/0 home win probability (a tie counts half) |

## `ratings.csv`

LOWFI/1 ratings for all 32 teams, going into the week.

| column | type | description |
|---|---|---|
| `team` | character | team abbreviation (nflverse) |
| `games_played` | numeric | **UNDOCUMENTED** |
| `off_rating` | numeric | LOWFI/1 offense: points scored per game above an average offense, against an average defense |
| `off_se` | numeric | standard error of off_rating |
| `def_rating` | numeric | LOWFI/1 defense, RAW coefficient: points allowed relative to average. More negative is better. The site shows -def_rating as points prevented. |
| `def_se` | numeric | standard error of the defense rating |
| `net_rating` | numeric | LOWFI/1 net rating: off_rating - def_rating, points per game against an average opponent on a neutral field |
| `pf_rating` | numeric | unadjusted points scored per game (for the raw rank) |
| `pa_rating` | numeric | unadjusted points allowed per game (for the raw rank) |

## `card_data.csv`

The team-page view: both models' ratings, record, scoring, schedule strength and season projections.

| column | type | description |
|---|---|---|
| `team` | character | team abbreviation (nflverse) |
| `games_played` | numeric | **UNDOCUMENTED** |
| `off_rating` | numeric | LOWFI/1 offense: points scored per game above an average offense, against an average defense |
| `off_se` | numeric | standard error of off_rating |
| `def_rating` | numeric | LOWFI/1 defense, RAW coefficient: points allowed relative to average. More negative is better. The site shows -def_rating as points prevented. |
| `def_se` | numeric | standard error of the defense rating |
| `net_rating` | numeric | LOWFI/1 net rating: off_rating - def_rating, points per game against an average opponent on a neutral field |
| `pf_rating` | numeric | unadjusted points scored per game (for the raw rank) |
| `pa_rating` | numeric | unadjusted points allowed per game (for the raw rank) |
| `conf` | character | conference |
| `division` | character | division |
| `team_color` | character | **UNDOCUMENTED** |
| `team_color2` | character | **UNDOCUMENTED** |
| `logo` | character | **UNDOCUMENTED** |
| `plot_color` | character | **UNDOCUMENTED** |
| `def_display` | numeric | LOWFI/1 defense as the site shows it: points prevented per game. Higher is better. Equals -def_rating. |
| `net_se` | numeric | standard error of net_rating |
| `div2` | character | **UNDOCUMENTED** |
| `g` | numeric | games played |
| `w` | numeric | wins |
| `l` | numeric | losses |
| `t` | numeric | ties |
| `pf` | numeric | points scored per game |
| `pa` | numeric | points allowed per game |
| `pd` | numeric | point differential per game |
| `pythag` | numeric | **UNDOCUMENTED** |
| `record` | character | win-loss(-tie) record |
| `sos_played` | numeric | mean LOWFI/1 net rating of opponents played |
| `sos_left` | numeric | mean LOWFI/1 net rating of opponents still to play |
| `m0_p` | numeric | LOWFI/0 true strength: posterior mean probability of beating an average opponent on a neutral field |
| `m0_sd` | numeric | standard deviation of the LOWFI/0 posterior |
| `m1_wins` | numeric | LOWFI/1 projected wins |
| `playoff` | numeric | share of simulated seasons making the playoffs |
| `div1` | numeric | share of simulated seasons winning the division |
| `won_sb` | numeric | share of simulated seasons winning the Super Bowl |
| `m0_wins` | numeric | LOWFI/0 projected wins |
| `m0_playoff` | numeric | LOWFI/0 share of simulated seasons making the playoffs |
| `m0_div1` | numeric | LOWFI/0 share of simulated seasons winning the division |
| `lg_pf` | numeric | league average points scored per game |
| `lg_pa` | numeric | league average points allowed per game |
| `pf_vs` | numeric | points scored per game minus the league average |
| `pa_vs` | numeric | league average minus points allowed per game (+ is better) |
| `pd_vs` | numeric | point differential per game against the league average |
| `n_games` | numeric | **UNDOCUMENTED** |
| `pythag_wins` | numeric | Pythagorean wins over 17 games, exponent 2.37 |
| `net_rank` | numeric | rank of net_rating, 1 to 32 |
| `off_rank` | numeric | rank of off_rating, 1 to 32 |
| `def_rank` | numeric | rank of the defense rating, 1 = best |
| `pf_rank` | numeric | rank of pf |
| `pa_rank` | numeric | rank of pa, 1 = fewest allowed |
| `pd_rank` | numeric | rank of pd |
| `prev_net` | numeric | **UNDOCUMENTED** |
| `net_change` | numeric | change in net_rating from the previous archived week |

## `projections.csv`

LOWFI/1 season projections from the simulation.

| column | type | description |
|---|---|---|
| `conf` | character | conference |
| `division` | character | division |
| `team` | character | team abbreviation (nflverse) |
| `wins` | numeric | mean projected wins across the simulated seasons |
| `playoff` | numeric | share of simulated seasons making the playoffs |
| `div1` | numeric | share of simulated seasons winning the division |
| `seed1` | numeric | share of simulated seasons as the conference's No.1 seed |
| `won_conf` | numeric | share of simulated seasons winning the conference |
| `won_sb` | numeric | share of simulated seasons winning the Super Bowl |
| `draft1` | numeric | share of simulated seasons ending with the No.1 draft pick |
| `draft5` | numeric | share of simulated seasons ending with a top-5 draft pick |
| `pd_ahead` | numeric | mean simulated point differential in the regular-season games still to play |

## `projections_m0.csv`

LOWFI/0 season projections from the simulation.

| column | type | description |
|---|---|---|
| `conf` | character | conference |
| `division` | character | division |
| `team` | character | team abbreviation (nflverse) |
| `wins` | numeric | mean projected wins across the simulated seasons |
| `playoff` | numeric | share of simulated seasons making the playoffs |
| `div1` | numeric | share of simulated seasons winning the division |
| `seed1` | numeric | share of simulated seasons as the conference's No.1 seed |
| `won_conf` | numeric | share of simulated seasons winning the conference |
| `won_sb` | numeric | share of simulated seasons winning the Super Bowl |
| `draft1` | numeric | share of simulated seasons ending with the No.1 draft pick |
| `draft5` | numeric | share of simulated seasons ending with a top-5 draft pick |
| `pd_ahead` | numeric | mean simulated point differential in the regular-season games still to play |

## `win_distribution.csv`

Every simulated win total, by team and model.

| column | type | description |
|---|---|---|
| `team` | character | team abbreviation (nflverse) |
| `model` | character | LOWFI/1 or LOWFI/0 |
| `wins` | numeric | mean projected wins across the simulated seasons |
| `n` | numeric | number of simulated seasons with this many wins |
| `p` | numeric | share of simulated seasons with this many wins |

## `schedule_remaining.csv`

Every game still to play, with both models' line and win probability and the market where posted.

| column | type | description |
|---|---|---|
| `game_id` | character | nflverse game identifier. JOIN KEY to nflverse schedules and play-by-play. |
| `week` | numeric | week of the season |
| `gameday` | Date | date of the game |
| `gametime` | hms | **UNDOCUMENTED** |
| `team_away` | character | away team |
| `team_home` | character | home team |
| `away_moneyline` | numeric | away moneyline, American odds |
| `home_moneyline` | numeric | home moneyline, American odds |
| `home_spread_odds` | numeric | **UNDOCUMENTED** |
| `away_spread_odds` | numeric | **UNDOCUMENTED** |
| `spread_line` | numeric | market spread as home margin (+ = home favored), as on file when written |
| `spread_pred` | numeric | LOWFI/1 expected home margin (+ = home favored) |
| `p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |
| `m0_margin` | numeric | LOWFI/0 win probability mapped to a home margin. A calibration, not a points forecast. |
| `p_home_m0` | numeric | LOWFI/0 home win probability (a tie counts half) |

## `rating_explanation.csv`

What each LOWFI/1 rating is built from, by term.

| column | type | description |
|---|---|---|
| `team` | character | team abbreviation (nflverse) |
| `week` | numeric | week of the season |
| `group` | character | the term of the LOWFI/1 rating this row adds |
| `.pred` | numeric | **UNDOCUMENTED** |
| `intercept` | numeric | **UNDOCUMENTED** |
| `total` | numeric | that term's contribution, points per game |
| `side` | character | offense or defense |

## `written.csv`

When the week's forecasts were written, and on what evidence.

| column | type | description |
|---|---|---|
| `file` | character | the archive file this timestamp dates |
| `written_utc` | POSIXct | when the week's forecasts were written, UTC |
| `backfilled` | logical | TRUE when the time was recovered after the fact rather than recorded by the run |
| `basis` | character | evidence for written_utc: run, line snapshot, or file modified time |

## `history/lowfi_history.csv`

| column | type | description |
|---|---|---|
| `season` | numeric | NFL season |
| `week` | numeric | week of the season |
| `team` | character | team abbreviation (nflverse) |
| `off_rating` | numeric | LOWFI/1 offense: points scored per game above an average offense, against an average defense |
| `def_rating` | numeric | LOWFI/1 defense, RAW coefficient: points allowed relative to average. More negative is better. The site shows -def_rating as points prevented. |
| `net_rating` | numeric | LOWFI/1 net rating: off_rating - def_rating, points per game against an average opponent on a neutral field |
| `p_hat` | numeric | LOWFI/0 true strength (posterior mean) |
| `alpha` | numeric | LOWFI/0 Beta posterior, alpha |
| `beta` | numeric | LOWFI/0 Beta posterior, beta |
| `source` | character | live (produced before the games) or retrodiction (today's model on a past season). See LOWFI_CAVEATS.md. |

## `scores/lowfi_scores.csv`

| column | type | description |
|---|---|---|
| `season` | numeric | NFL season |
| `week` | numeric | week of the season |
| `game_type` | character | REG or POST |
| `mult` | numeric | points multiplier (1 in the regular season) |
| `game_id` | character | nflverse game identifier. JOIN KEY to nflverse schedules and play-by-play. |
| `gameday` | Date | date of the game |
| `team_away` | character | away team |
| `team_home` | character | home team |
| `result` | numeric | final home margin |
| `home_won` | numeric | 1 home win, 0 home loss, NA tie |
| `p_home_m1` | numeric | LOWFI/1 home win probability, as scored |
| `p_home_m0` | numeric | LOWFI/0 home win probability (a tie counts half) |
| `p_home_mkt` | numeric | market home win probability, as scored (see LOWFI_CAVEATS.md for which market) |
| `p_home_mkt_ml` | numeric | retrodiction only: market home win probability from the closing moneyline, de-vigged |
| `pts_m1` | numeric | LOWFI/1 scoreboard points for the game |
| `pts_m0` | numeric | LOWFI/0 scoreboard points for the game |
| `pts_mkt` | numeric | market scoreboard points for the game |
| `pts_mkt_ml` | numeric | retrodiction only: moneyline market scoreboard points |
| `source` | character | live (produced before the games) or retrodiction (today's model on a past season). See LOWFI_CAVEATS.md. |

