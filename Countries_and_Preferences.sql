with prep as (
SELECT *,
case 
  when (beer_servings > spirit_servings and beer_servings > wine_servings) then 'Beer'
  when (spirit_servings >  wine_servings and spirit_servings > beer_servings) then 'Spirit'
  when (wine_servings > beer_servings and wine_servings > spirit_servings) then 'Wine'
  else null
   end as preferred_drink
FROM playground.drinks
)

select country, preferred_drink
from prep
where preferred_drink IS NOT NULL AND preferred_drink IN ('Wine', 'Spirit')
order by country 
