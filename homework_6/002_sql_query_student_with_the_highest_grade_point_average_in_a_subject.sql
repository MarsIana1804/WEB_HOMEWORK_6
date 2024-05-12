SELECT student_id, student_name, subject_name, average_grade
FROM (
       SELECT *, ROW_NUMBER() OVER (PARTITION BY subject_name ORDER BY average_grade DESC) as rwnbr
       FROM (
              SELECT s.id as student_id, s.name as student_name, sub.name as subject_name, AVG(g.grade) AS average_grade 
       
              FROM students as s
              INNER JOIN grades g 
              ON s.id = g.student_id
              INNER JOIN subjects as sub
              ON sub.id=g.subject_id

              GROUP BY s.id, s.name, sub.name
             )a
     )b
WHERE rwnbr=1