with prep as (
SELECT pr.product_id,product_name,sale_date
FROM playground.products pr
left join playground.product_sales pr_sales on pr.product_id = pr_sales.product_id)
, data as (
select product_id,product_name
, max(sale_date) max_date
, min(sale_date) min_date
from prep 
group by 1,2
having max(sale_date) <= cast('2024-01-31' as date)
)

select product_id, product_name
from data
