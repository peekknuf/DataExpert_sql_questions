with prep as (
select * from playground.views
group by 1,2,3,4)
, cte as (
SELECT *, count() over (partition by viewer_id order by viewer_id) same_day
FROM prep 
)

select distinct viewer_id
from cte
where same_day >= 2
order by viewer_id
