# Write your MySQL query statement below
WITH daily_sales AS (SELECT
 visited_on,
SUM(amount) AS daily_amount
 FROM Customer
GROUP BY visited_on
),
temp AS (
SELECT
visited_on,
SUM(daily_amount) OVER (
 ORDER BY visited_on
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS amount,
ROUND(
AVG(daily_amount) OVER (
 ORDER BY visited_on
 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
),
 2
) AS average_amount,
ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
FROM daily_sales
)

SELECT
visited_on,
amount,
average_amount
FROM temp
WHERE rn >= 7;