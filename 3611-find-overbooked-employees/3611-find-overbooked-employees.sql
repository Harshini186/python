# Write your MySQL query statement below
select e.employee_id,e.employee_name,e.department,COUNT(*) AS meeting_heavy_weeks
from employees e
JOIN 
(
    SELECT
        employee_id,YEARWEEK(meeting_date, 1) AS meeting_week
    FROM meetings
    GROUP BY employee_id,YEARWEEK(meeting_date, 1)
    HAVING SUM(duration_hours) > 20
) AS weekly
ON e.employee_id = weekly.employee_id
GROUP BY e.employee_id,e.employee_name,e.department
HAVING COUNT(*) >= 2
ORDER BY meeting_heavy_weeks DESC,e.employee_name ASC;