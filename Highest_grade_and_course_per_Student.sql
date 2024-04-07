with prep as (
select *,
row_number() over (partition by student_id order by student_id, grade desc, course_id) as rnked
from playground.student_grades)

select student_id
      ,course_id
      ,grade 
from prep 
where rnked = 1
order by student_id
