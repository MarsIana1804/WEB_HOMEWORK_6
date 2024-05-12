--Знайти середній бал у групах з певного предмета.
select gr.name as group_name, sub.name as subject_name, CAST(AVG(g.grade) AS DECIMAL(10, 2)) as average_grade
from students as s 
inner join groups as gr
on s.group_id=gr.id
inner join grades as g
on s.id=g.student_id
inner join subjects as sub
on g.subject_id=sub.id
group by gr.name,sub.name
order by gr.name, sub.name