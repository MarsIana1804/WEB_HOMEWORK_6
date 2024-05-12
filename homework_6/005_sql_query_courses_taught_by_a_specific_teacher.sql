SELECT t.name as teacher_name, 
       sub.name as subject_name
FROM teachers t 
	INNER JOIN subjects sub
	   ON t.id = sub.teacher_id
ORDER BY t.name;