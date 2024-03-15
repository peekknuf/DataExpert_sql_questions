with data as (
SELECT state,percent_alcohol_impaired, avg(percent_alcohol_impaired) over () as national_average
FROM playground.bad_drivers 
),
critical as (
select *, national_average + (national_average * 0.2) critical_point from data)

select state,percent_alcohol_impaired from critical where 	percent_alcohol_impaired > critical_point
order by percent_alcohol_impaired desc
