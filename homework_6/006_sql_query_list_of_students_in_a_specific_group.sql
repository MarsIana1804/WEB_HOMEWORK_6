SELECT s.name as student_name, 
	   gr.name as group_name
FROM students s 
  INNER JOIN groups gr 
     ON s.group_id = gr.id
ORDER BY gr.name, s.name;

