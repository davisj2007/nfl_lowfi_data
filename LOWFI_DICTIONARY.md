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
| `game_played` | logical | TRUE once the game has a final result; FALSE for every game in a forecast week |
| `result` | logical | final home margin |
| `spread_line` | numeric | market spread as home margin (+ = home favored), as on file when written |
| `total_line` | numeric | market over/under total points, as on file when written |
| `div_game` | numeric | 1 for a division game |
| `off_rating_home` | numeric | home team's LOWFI/1 offense going into the game |
| `def_rating_home` | numeric | home team's LOWFI/1 defense going into the game, RAW coefficient (more negative is better) |
| `net_rating_home` | numeric | home team's LOWFI/1 net rating going into the game |
| `off_se_home` | numeric | standard error of off_rating_home |
| `def_se_home` | numeric | standard error of def_rating_home |
| `games_played_home` | numeric | games the home team had played before this one |
| `team_away` | character | away team |
| `off_rating_away` | numeric | away team's LOWFI/1 offense going into the game |
| `def_rating_away` | numeric | away team's LOWFI/1 defense going into the game, RAW coefficient (more negative is better) |
| `net_rating_away` | numeric | away team's LOWFI/1 net rating going into the game |
| `off_se_away` | numeric | standard error of off_rating_away |
| `def_se_away` | numeric | standard error of def_rating_away |
| `games_played_away` | numeric | games the away team had played before this one |
| `strength_diff` | numeric | (off_rating_home - off_rating_away) + (def_rating_away - def_rating_home): the ratings' implied home edge, before home field. A diagnostic; the spread model regresses on the four ratings directly. |
| `spread_pred` | numeric | LOWFI/1 expected home margin (+ = home favored) |
| `gameday` | Date | date of the game |
| `gametime` | hms | scheduled kickoff time, US Eastern (nflverse) |
| `home_moneyline` | numeric | home moneyline, American odds |
| `away_moneyline` | numeric | away moneyline, American odds |
| `home_spread_odds` | numeric | American odds on the home side of the spread |
| `away_spread_odds` | numeric | American odds on the away side of the spread |
| `p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |
| `p_cover_home` | numeric | LOWFI/1 probability the home team beats the spread |
| `p_push` | numeric | LOWFI/1 probability the game lands exactly on the spread |
| `model_p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |
| `model_p_away` | numeric | LOWFI/1 away win probability (a tie counts half): 1 - model_p_home |
| `p_cover_away` | numeric | LOWFI/1 probability the away team beats the spread |
| `mkt_p_home` | numeric | market home win probability, de-vigged from the moneylines |
| `mkt_hold_ml` | numeric | bookmaker margin in the moneylines: the two implied probabilities' sum, minus 1 |
| `mkt_p_cover_home` | numeric | market probability the home team covers, de-vigged from the spread odds |
| `mkt_hold_spread` | numeric | bookmaker margin in the spread odds: the two implied probabilities' sum, minus 1 |
| `ev_ml_home` | numeric | expected value per unit staked on the home moneyline, at LOWFI/1's probability |
| `ev_ml_away` | numeric | expected value per unit staked on the away moneyline, at LOWFI/1's probability |
| `ev_sp_home` | numeric | expected value per unit staked on the home spread; a push returns the stake |
| `ev_sp_away` | numeric | expected value per unit staked on the away spread; a push returns the stake |
| `units_ml_home` | numeric | LOWFI/1 quarter-Kelly stake on the home moneyline, units per 100. Zero means pass. Not advice. |
| `units_ml_away` | numeric | LOWFI/1 quarter-Kelly stake on the away moneyline, units per 100. Zero means pass. Not advice. |
| `units_sp_home` | numeric | LOWFI/1 quarter-Kelly stake on the home side, units per 100. Zero means pass. Not advice. |
| `units_sp_away` | numeric | LOWFI/1 quarter-Kelly stake on the away side, units per 100. Zero means pass. Not advice. |
| `edge_points` | numeric | spread_pred - spread_line: LOWFI/1's disagreement with the market, points, home side |
| `edge_prob` | numeric | model_p_home - mkt_p_home: the same disagreement as a probability |

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
| `games_played` | numeric | games the team had played before this week |
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
| `games_played` | numeric | games the team had played before this week |
| `off_rating` | numeric | LOWFI/1 offense: points scored per game above an average offense, against an average defense |
| `off_se` | numeric | standard error of off_rating |
| `def_rating` | numeric | LOWFI/1 defense, RAW coefficient: points allowed relative to average. More negative is better. The site shows -def_rating as points prevented. |
| `def_se` | numeric | standard error of the defense rating |
| `net_rating` | numeric | LOWFI/1 net rating: off_rating - def_rating, points per game against an average opponent on a neutral field |
| `pf_rating` | numeric | unadjusted points scored per game (for the raw rank) |
| `pa_rating` | numeric | unadjusted points allowed per game (for the raw rank) |
| `conf` | character | conference |
| `division` | character | division |
| `team_color` | character | team primary color (nflverse) |
| `team_color2` | character | team secondary color (nflverse) |
| `logo` | character | team logo URL (nflverse) |
| `plot_color` | character | the team color used on charts, chosen to show on a black background |
| `def_display` | numeric | LOWFI/1 defense as the site shows it: points prevented per game. Higher is better. Equals -def_rating. |
| `net_se` | numeric | standard error of net_rating |
| `div2` | character | division without the conference: East, North, South or West |
| `g` | numeric | games played |
| `w` | numeric | wins |
| `l` | numeric | losses |
| `t` | numeric | ties |
| `pf` | numeric | points scored per game |
| `pa` | numeric | points allowed per game |
| `pd` | numeric | point differential per game |
| `pythag` | numeric | Pythagorean win percentage: pf^2.37 / (pf^2.37 + pa^2.37) |
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
| `n_games` | numeric | games played to date, as counted for the team view |
| `pythag_wins` | numeric | Pythagorean wins over 17 games, exponent 2.37 |
| `net_rank` | numeric | rank of net_rating, 1 to 32 |
| `off_rank` | numeric | rank of off_rating, 1 to 32 |
| `def_rank` | numeric | rank of the defense rating, 1 = best |
| `pf_rank` | numeric | rank of pf |
| `pa_rank` | numeric | rank of pa, 1 = fewest allowed |
| `pd_rank` | numeric | rank of pd |
| `prev_net` | numeric | LOWFI/1 net rating in the previous archived week; net_change is net_rating - prev_net |
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
| `gametime` | hms | scheduled kickoff time, US Eastern (nflverse) |
| `team_away` | character | away team |
| `team_home` | character | home team |
| `away_moneyline` | numeric | away moneyline, American odds |
| `home_moneyline` | numeric | home moneyline, American odds |
| `home_spread_odds` | numeric | American odds on the home side of the spread |
| `away_spread_odds` | numeric | American odds on the away side of the spread |
| `spread_line` | numeric | market spread as home margin (+ = home favored), as on file when written |
| `spread_pred` | numeric | LOWFI/1 expected home margin (+ = home favored) |
| `p_home` | numeric | LOWFI/1 home win probability (a tie counts half) |

## `rating_explanation.csv`

What each LOWFI/1 rating is built from, by term.

| column | type | description |
|---|---|---|
| `team` | character | team abbreviation (nflverse) |
| `week` | numeric | week of the season |
| `group` | character | the term of the LOWFI/1 rating this row adds |
| `.pred` | numeric | the rating this side's terms add up to: intercept + the sum of total over its rows, exactly |
| `intercept` | numeric | the model's baseline, a league-average team, before any term is added |
| `total` | numeric | that term's contribution, points per game |
| `side` | character | offense or defense |

## `written.csv`

When the week's forecasts were written, and on what evidence.

| column | type | description |
|---|---|---|
| `file` | character | the archive file this timestamp dates |
| `written_utc` | POSIXct | when the week's forecasts were written, UTC |
| `backfilled` | logical | TRUE when the time was recovered after the fact rather than recorded by the run |

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

