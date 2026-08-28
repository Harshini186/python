# Write your MySQL query statement below
select c1.name
from customer as c1 
join 
customer as c2
on c1.id=c2.id
where c1.referee_id is null or c1.referee_id!=2