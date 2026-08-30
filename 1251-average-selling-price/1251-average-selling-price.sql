# Write your MySQL query statement below
SELECT p.product_id,
        round(COALESCE(SUM(u.units * p.price) / SUM(u.units), 0),2) as average_price
FROM Prices as p
LEFT JOIN 
UnitsSold as u
ON p.product_id = u.product_id and u.purchase_date Between p.start_date and p.end_date
GROUP BY p.product_id