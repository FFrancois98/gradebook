USE gradebook;
-- TASK 4
-- How to calculate the avg score of an assignment
SELECT AVG(points),
		assign_id
FROM student_scores
WHERE assign_id = 9
GROUP BY assign_id;
-- How to calculate the highest score of an assignment
SELECT MAX(points),
		assign_id
FROM student_scores
WHERE assign_id = 9
GROUP BY assign_id;
-- How to calculate the lowest score of an assignment
SELECT MIN(points),
		assign_id
FROM student_scores
WHERE assign_id = 9
GROUP BY assign_id;