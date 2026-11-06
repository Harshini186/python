# Write your MySQL query statement below
with ranked_inventory as (
    select store_id,product_name,quantity,price,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY price DESC, inventory_id 
        ) as expensive_rank,
        ROW_NUMBER() OVER (
            PARTITION BY store_id
            ORDER BY price,inventory_id
        ) as cheap_rank
    from inventory
),
store_summary as (
    select store_id,COUNT(*) AS total_products
    from inventory
    group by store_id
)
select s.store_id,s.store_name,s.location,
    max(case
        when r.expensive_rank = 1 then r.product_name
    END) as most_exp_product,
    max(case
        when r.cheap_rank = 1 then r.product_name
    END) as cheapest_product,
    round(
        max(case when r.cheap_rank = 1 then r.quantity END) /max(case when r.expensive_rank = 1 then r.quantity END),2) as imbalance_ratio
from stores as s
join
ranked_inventory as r
on s.store_id = r.store_id
join
store_summary as ss
on s.store_id = ss.store_id
where ss.total_products >= 3
group by s.store_id, s.store_name, s.location
having max(case when r.expensive_rank = 1 then r.quantity END) < max(case when r.cheap_rank = 1 then r.quantity end)
order by imbalance_ratio DESC,s.store_name 