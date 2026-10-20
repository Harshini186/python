# Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs as l1
JOIN 
Logs as l2 
ON l1.id = l2.id - 1
JOIN 
Logs as l3 ON l2.id = l3.id - 1
WHERE l1.num = l2.num and l2.num = l3.num