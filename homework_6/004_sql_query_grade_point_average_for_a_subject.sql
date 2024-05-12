SELECT sub.name as subject_name, 
       AVG(g.grade) avg_grad
FROM grades g
	INNER JOIN subjects sub
	  ON g.subject_id = sub.id
GROUP BY sub.name
ORDER BY sub.name;

