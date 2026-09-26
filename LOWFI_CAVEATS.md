# Caveats

These travel with every LOWFI figure. They are a file rather than a paragraph in a
post because data outlives prose.

## 1. Live and retrodiction are different things

`source = "live"` means produced by that week's run before the week's games and
archived unchanged. `source = "retrodiction"` means today's model applied to a
season already played, revealed to it a week at a time. The timing inside a
retrodicted season is honest (a week 10 game is forecast from week 9 ratings), but
the model was built knowing how those seasons ended. Retrodictions describe the
model; only live rows are a track record.

## 2. 2023 to 2025 are in the training data

The production model is fitted on seasons through 2025, so retrodictions for 2023
on are in-sample. Treat them as the least informative seasons in the history.

## 3. A forecast counts only if it existed before kickoff

Every weekly folder carries `written.csv`: when its forecasts were written and on
what evidence (`run` when the run recorded it; `line snapshot` when recovered from
the line snapshot the same run saved). A week whose archive was written after its
first game is not released and not scored. Released weeks never change after
their first game.

## 4. "Market" means two different prices

Live: the market win probability on file with that week's forecasts, de-vigged
from the moneylines, and the spread posted at the time. Retrodiction: the closing
spread run through the same margin distribution the models use (`p_home_mkt`),
with the closing moneyline alongside where available (`p_home_mkt_ml`). Compare
seasons within a source, not across.

## 5. LOWFI/0's line is a translation

LOWFI/0 only sees wins and losses. `m0_margin` is its win probability mapped to
points by a regression fitted on training seasons: a calibration, not a forecast
of the score.

## 6. Defense has two signs

`def_rating` is the raw coefficient: more negative is better. `def_display` and
the site show points prevented, `-def_rating`, where higher is better.

## 7. Regular season only

LOWFI rates teams from regular-season games; playoff games are not forecast or
scored.

## 8. Stakes are a comparison, not advice

`units_sp_home` and `units_sp_away` are quarter-Kelly stakes in units per 100,
zero where the model passes. LOWFI wasn't built to beat the market, and it usually
doesn't.
