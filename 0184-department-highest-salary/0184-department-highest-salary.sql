# Write your MySQL query statement below
SELECT
    d.name as Department,
    e.name as Employee,
    e.salary as Salary
FROM Employee as e
JOIN 
Department as d
    on e.departmentId = d.id
where (e.departmentId, e.salary) in (
    select departmentId, max(salary)
    from Employee
    group by departmentId
)