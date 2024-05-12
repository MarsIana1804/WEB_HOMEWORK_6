select t.name as teacher_name,
       s.name as student_name, 
       sbj.name as subject_name
       
from students as s
     inner join 

         (select student_id, subject_id 
          from grades
          group by student_id, subject_id)
          as g
        on s.id=g.student_id
     inner join subjects as sbj
        on g.subject_id=sbj.id 
     inner join teachers as t
        on t.id=sbj.teacher_id

order by t.name, s.name