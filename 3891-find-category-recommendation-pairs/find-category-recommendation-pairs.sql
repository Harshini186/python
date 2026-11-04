# Write your MySQL query statement below
select p1.category as category1,p2.category as category2,count(distinct pp1.user_id) as customer_count
from ProductPurchases as pp1
JOIN 
ProductInfo as p1
ON pp1.product_id = p1.product_id
JOIN 
ProductPurchases as pp2
ON pp1.user_id = pp2.user_id
JOIN 
ProductInfo as p2
ON pp2.product_id = p2.product_id
where p1.category < p2.category
group by p1.category, p2.category
having count(distinct pp1.user_id) >= 3
order by customer_count DESC,category1,category2