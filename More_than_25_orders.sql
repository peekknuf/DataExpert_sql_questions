with cte as
(SELECT 
customer_id
, customer_name
, count(row_id) order_count
FROM playground.superstore
group by 1,2
having count(row_id) > 20
)

select * from cte
order by order_count desc, customer_name asc
