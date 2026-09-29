# LOWFI — NFL ratings and forecasts, on box scores alone

Two models. **LOWFI/1** rates every offense and defense in points per game against
an average opponent. **LOWFI/0**, the original, sees only who won and keeps one
number per team: its true strength. Both forecast every game and simulate the
rest of the season each Tuesday.

Site: https://lowfi.jakedavisanalytics.com

## What is here

| path | what |
|---|---|
| `data/weekly/2026/wkNN/` | each week's archive as that Tuesday's run wrote it, before the games. **The record.** 4 weeks released so far. |
| `data/history/lowfi_history` | every team, every week, 2004–2026: both models' ratings, labeled `live` or `retrodiction` |
| `data/scores/lowfi_scores` | every scored regular-season game, both models and the market, labeled `live` or `retrodiction` |

Weekly files are CSV. The two databases are CSV and Parquet, same contents.

In each weekly folder:

| file | what |
|---|---|
| `bets.csv` | the week's games: LOWFI/1 line and win probability, the market line and price, cover, push and stake |
| `games_m0.csv` | the week's games: LOWFI/0 implied line and win probability |
| `ratings.csv` | LOWFI/1 ratings for all 32 teams, going into the week |
| `card_data.csv` | the team-page view: both models' ratings, record, scoring, schedule strength and season projections |
| `projections.csv` | LOWFI/1 season projections from the simulation |
| `projections_m0.csv` | LOWFI/0 season projections from the simulation |
| `win_distribution.csv` | every simulated win total, by team and model |
| `schedule_remaining.csv` | every game still to play, with both models' line and win probability and the market where posted |
| `rating_explanation.csv` | what each LOWFI/1 rating is built from, by term |
| `written.csv` | when the week's forecasts were written, and on what evidence |

## Start here

- `LOWFI_DICTIONARY.md`: every column, generated from the data
- `LOWFI_CAVEATS.md`: **read this before publishing anything**
- `examples/`: score a week yourself; plot a team over time

## How it is kept honest

Each week's forecasts are archived before the week's first game and read back
unchanged. A released week never changes after kickoff. Nothing here is refit
after the fact: the weekly folders are what existed at the time.

## License and citation

Released under **Creative Commons Attribution 4.0** (CC BY 4.0): share and adapt,
including commercially, with attribution. See `LICENSE.md`.

Built on schedule and score data from **nflverse**, also CC BY 4.0: credit nflverse
alongside LOWFI.

Cite as:

> Davis, J. (2026). *LOWFI: NFL ratings and forecasts*, data release through 2026 wk04. Jake Davis Analytics. https://lowfi.jakedavisanalytics.com

## Not released

The fitted models, and the preseason market win totals the LOWFI/1 prior is built
from (third-party data, not ours to redistribute).
