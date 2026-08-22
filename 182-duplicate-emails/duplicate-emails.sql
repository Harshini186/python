# Write your MySQL query statement below
select email as Email
from person
Group by email
Having count(*)>1