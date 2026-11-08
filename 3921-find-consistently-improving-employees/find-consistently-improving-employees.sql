# Write your MySQL query statement below
WITH ranked_reviews as (
    select employee_id,review_date,review_id,rating,
        ROW_NUMBER() over (
            partition by employee_id
            order by review_date DESC, review_id DESC
        ) as rn
    from performance_reviews
),
last_three as (
    select
        employee_id,max(case when rn = 1 then rating end) as latest_rating,
        max(case when rn = 2 then rating end) as middle_rating,
        max(case when rn = 3 then rating end) as earliest_rating
    from ranked_reviews
    where rn <= 3
    group by employee_id
    having count(*) = 3
)
select e.employee_id,e.name,lt.latest_rating - lt.earliest_rating as improvement_score
from employees as e
join
last_three as lt
on e.employee_id = lt.employee_id
where lt.earliest_rating < lt.middle_rating and lt.middle_rating < lt.latest_rating
order by improvement_score DESC,e.name