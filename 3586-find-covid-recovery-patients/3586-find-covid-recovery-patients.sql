# Write your MySQL query statement below
select
    p.patient_id,p.patient_name,p.age,
    DATEDIFF(
        min(case when c.result = 'Negative' and c.test_date > pos.first_positive then c.test_date END),
        pos.first_positive
    ) as recovery_time
from patients as p
join (
    select patient_id, min(test_date) as first_positive
    from covid_tests
    where result = 'Positive'
    group by patient_id
) as pos
on p.patient_id = pos.patient_id
join covid_tests as c
on p.patient_id = c.patient_id
group by p.patient_id,p.patient_name,p.age,pos.first_positive
having recovery_time is not null
order by recovery_time,p.patient_name 