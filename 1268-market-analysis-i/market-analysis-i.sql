# Write your MySQL query statement below
SELECT u.user_id AS buyer_id,u.join_date,
    COUNT(
        CASE
            WHEN o.order_date >= '2019-01-01' and o.order_date < '2020-01-01'
            THEN o.order_id
        END
    ) as orders_in_2019
FROM Users as u
LEFT JOIN 
Orders as o
ON u.user_id = o.buyer_id
GROUP BY u.user_id,u.join_date