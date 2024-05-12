SELECT s.name as student_name, 
       gr.name as group_name,
       sub.name as subject,
       g.grade
              
FROM students s 
    INNER JOIN groups gr 
      ON s.group_id = gr.id
    INNER JOIN grades g
      ON s.id=g.student_id
    INNER JOIN subjects sub
      ON sub.id=g.subject_id
ORDER BY gr.name, sub.name, s.name;