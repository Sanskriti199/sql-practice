# Write your MySQL query statement below
WITH ConsecutiveNumsCTE AS(SELECT num,
LEAD(NUM,1)OVER() num1,
LEAD(NUM,2)OVER()num2
FROM Logs)
SELECT DISTINCT num AS ConsecutiveNums
FROM ConsecutiveNumsCTE
WHERE num=num1
AND num=num2