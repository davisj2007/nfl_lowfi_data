# Corrections

Released weeks do not change after kickoff, with one exception: a bug fix that
corrects specific columns. Each one is listed here. A correction recomputes those
columns from the week's own archived inputs with the same model, so no later
information enters, and `written.csv` is never touched. The release checks that
no other column changed. The files as first released are in this repository's
git history.

| # | season | weeks | file | columns | corrected | what |
|---|---|---|---|---|---|---|
| 1 | 2026 | wk01 to wk10 | `bets.csv` | `p_cover_home`, `p_cover_away`, `p_push`, `ev_sp_home`, `ev_sp_away`, `units_sp_home`, `units_sp_away` | 2026-11-11 | The cover probability read spread_line as a handicap (negative = favored) instead of the home margin it is (positive = favored), so it priced the wrong side of the line. Recomputed from each week's archived spread_pred, spread_line and spread odds with the model that week used (week 1 predates the 2026-09-02 production refit and used the earlier fit), checked against each week's archived win probabilities to 1e-9; no later information enters. Nothing else in the file changed: the line, both win probabilities, the moneyline EVs and stakes, and the scoreboard were never affected. |
