with filtered as (
select *
from (
SELECT *, avg(occurences) over (partition by event_type) as avg_wind
FROM playground.business_events ) a
where occurences > avg_wind)

select distinct business_id from filtered
