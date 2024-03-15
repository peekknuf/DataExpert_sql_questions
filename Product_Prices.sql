with cte as (SELECT product_id, 
case 
  when change_date <= CAST('2023-08-17' AS DATE) THEN new_price
  else d_price end as price, change_date
FROM playground.product_prices
group by 1,2,3 
order by product_id
)

select product_id, 
max(price) as price from cte 
group by 1 order by 1
