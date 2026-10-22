# Write your MySQL query statement below
select c1.visited_on,sum(c2.amount) as amount,round(sum(c2.amount) / 7, 2) as average_amount
FROM (
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
) as c1
JOIN 
(
    select visited_on, sum(amount) as amount
    from Customer
    group by visited_on
) as c2
ON c2.visited_on between DATE_SUB(c1.visited_on, INTERVAL 6 DAY) and c1.visited_on
group by c1.visited_on
having count(*) = 7
order by c1.visited_on