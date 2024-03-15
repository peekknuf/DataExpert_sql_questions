with cte as (SELECT id
                    , month
                    , sum(sales) total_sales
                    , dense_rank() over (partition by month order by sum(sales) desc) as "rank"
FROM playground.sales
group by 1,2
)
select id, "rank"
from cte
where "rank" <= 2
order by month desc 
