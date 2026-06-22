# Write your MySQL query statement below
WITH total_weight_CTE AS(
    SELECT  turn,
    person_name,
    weight,
    SUM(weight)OVER(ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name
FROM Queue
WHERE turn=(SELECT MAX(turn)FROM total_weight_CTE WHERE total_weight<=1000)