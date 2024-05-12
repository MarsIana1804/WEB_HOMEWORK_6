--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
select s.id as student_id, s.name as student_name, g.subject_id, AVG(g.grade) as average_grade  
from students as s
     join grades as g
     on s.id= g.student_id
group by s.id, g.subject_id
order by average_grade desc
limit 5