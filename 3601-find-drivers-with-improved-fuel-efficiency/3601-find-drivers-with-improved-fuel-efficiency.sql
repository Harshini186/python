# Write your MySQL query statement below
select d.driver_id,d.driver_name,
    round(
        avg(
            case
                when MONTH(t.trip_date) between 1 and 6 then t.distance_km / t.fuel_consumed
            END
        ), 2) as first_half_avg,
    round(
        avg(
            case
                when MONTH(t.trip_date) between 7 and 12 then t.distance_km / t.fuel_consumed
            end
        ), 2) as second_half_avg,
    round(
        avg(
            case
                when MONTH(t.trip_date) between 7 and 12 then t.distance_km / t.fuel_consumed
            end
        ) - avg(
            case
                when MONTH(t.trip_date) between 1 and 6 then t.distance_km / t.fuel_consumed
            end
        ), 2) as efficiency_improvement
from drivers as d
JOIN 
trips as t
on d.driver_id = t.driver_id
group by d.driver_id, d.driver_name
having sum(MONTH(t.trip_date) between 1 and 6) > 0
    and sum(MONTH(t.trip_date) between 7 and 12) > 0
    and efficiency_improvement > 0
order by efficiency_improvement desc,d.driver_name 