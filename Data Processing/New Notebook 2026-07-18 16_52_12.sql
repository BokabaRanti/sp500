-- Databricks notebook source
SELECT * FROM sp500_clean.sp500.sp500_clean;

SELECT * FROM sp500_clean.sp500.sp500_clean LIMIT 100;

SELECT COUNT(*) AS total_records FROM sp500_clean.sp500.sp500_clean;

SELECT
  ticker,
  event_date,
  firm,
  COUNT(*) AS Duplicate_Count
FROM sp500_clean.sp500.sp500_clean
GROUP BY
  ticker,
  event_date,
  firm
HAVING COUNT(*) > 1;

SELECT
  SUM(CASE WHEN ticker IS NULL THEN 1 ELSE 0 END) AS Missing_Ticker,
  SUM(CASE WHEN event_date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
  SUM(CASE WHEN firm IS NULL THEN 1 ELSE 0 END) AS Missing_Firm,
  SUM(CASE WHEN from_grade IS NULL THEN 1 ELSE 0 END) AS Missing_From_Grade,
  SUM(CASE WHEN to_grade IS NULL THEN 1 ELSE 0 END) AS Missing_To_Grade,
  SUM(CASE WHEN action IS NULL THEN 1 ELSE 0 END) AS Missing_Action,
  SUM(CASE WHEN current_price_target IS NULL THEN 1 ELSE 0 END) AS Missing_Current_Target,
  SUM(CASE WHEN prior_price_target IS NULL THEN 1 ELSE 0 END) AS Missing_Prior_Target
FROM sp500_clean.sp500.sp500_clean;

UPDATE sp500_clean.sp500.sp500_clean
SET firm = NULL
WHERE TRIM(firm) = '';

UPDATE sp500_clean.sp500.sp500_clean
SET from_grade = NULL
WHERE TRIM(from_grade) = '';

UPDATE sp500_clean.sp500.sp500_clean
SET to_grade = NULL
WHERE TRIM(to_grade) = '';

UPDATE sp500_clean.sp500.sp500_clean
SET action = UPPER(action);

UPDATE sp500_clean.sp500.sp500_clean
SET implied_direction = UPPER(implied_direction);

UPDATE sp500_clean.sp500.sp500_clean
SET ticker = UPPER(ticker);

UPDATE sp500_clean.sp500.sp500_clean
SET event_datetime = CAST(event_date AS TIMESTAMP);

SELECT
YEAR(event_datetime) AS Year,
COUNT(*) AS Ratings
FROM sp500_clean.sp500.sp500_clean
GROUP BY YEAR(event_datetime)
ORDER BY Year;

SELECT
  MONTH(event_datetime) AS Month_Number,
  DATE_FORMAT(event_datetime, 'MMMM') AS Month_Name,
  COUNT(*) AS Total_Ratings
FROM sp500_clean.sp500.sp500_clean
GROUP BY
  MONTH(event_datetime),
  DATE_FORMAT(event_datetime, 'MMMM')
ORDER BY Month_Number;

SELECT
  DATE_FORMAT(event_datetime, 'EEEE') AS Weekday,
  COUNT(*) AS Total
FROM sp500_clean.sp500.sp500_clean
GROUP BY DATE_FORMAT(event_datetime, 'EEEE')
ORDER BY Total DESC;

SELECT *
FROM sp500_clean.sp500.sp500_clean
WHERE current_price_target < 0
OR prior_price_target < 0;

UPDATE sp500_clean.sp500.sp500_clean
SET current_price_target = NULL
WHERE current_price_target < 0;

UPDATE sp500_clean.sp500.sp500_clean
SET prior_price_target = NULL
WHERE prior_price_target < 0;

SELECT DISTINCT from_grade
FROM sp500_clean.sp500.sp500_clean
ORDER BY from_grade;

SELECT DISTINCT to_grade
FROM sp500_clean.sp500.sp500_clean
ORDER BY to_grade;

SELECT action,
COUNT(*) AS Total
FROM sp500_clean.sp500.sp500_clean
GROUP BY action
ORDER BY Total DESC;

SELECT
implied_direction,
COUNT(*) AS Total
FROM sp500_clean.sp500.sp500_clean
GROUP BY implied_direction;

SELECT

MIN(forward_return_30d_pct) AS Min30,

MAX(forward_return_30d_pct) AS Max30,

MIN(forward_return_90d_pct) AS Min90,

MAX(forward_return_90d_pct) AS Max90,

MIN(forward_return_180d_pct) AS Min180,

MAX(forward_return_180d_pct) AS Max180,

MIN(forward_return_365d_pct) AS Min365,

MAX(forward_return_365d_pct) AS Max365

FROM sp500_clean.sp500.sp500_clean;

SELECT
  accuracy_30d,
  COUNT(*) AS Total
FROM sp500_clean.sp500.sp500_clean
GROUP BY accuracy_30d;

CREATE OR REPLACE TABLE sp500_clean.sp500.sp500_final AS
SELECT
  ticker,
  event_datetime,
  firm,
  from_grade,
  to_grade,
  action,
  price_target_action,
  current_price_target,
  prior_price_target,
  implied_direction,
  forward_return_30d_pct,
  forward_return_90d_pct,
  forward_return_180d_pct,
  forward_return_365d_pct,
  accuracy_30d,
  accuracy_90d,
  accuracy_180d,
  accuracy_365d
FROM sp500_clean.sp500.sp500_clean;
