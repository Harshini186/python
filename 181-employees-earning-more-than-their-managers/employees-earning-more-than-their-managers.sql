# Write your MySQL query statement below
select T1.name as Employee
from Employee as T1
join 
Employee as T2
on T1.managerId=T2.id
where T1.salary>T2.salary