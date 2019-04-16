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

-- TASK 5 QUERY
-- List all of the students in a given course;
SELECT 
	reg.course_id,
	stu.student_id,
    stu.lname,
    stu.fname
FROM registration reg
JOIN students stu ON stu.student_id = reg.student_id
WHERE course_id = 2;

-- TASK 6 QUERY
-- List all of the students in a course and all of their scores on every assignment;
SELECT 
	asg.course_id,
    sc.student_id,
    stu.fname,
    stu.lname,
    sc.assign_id,
    sc.points
FROM student_scores sc
JOIN assignments asg ON asg.assign_id = sc.assign_id
JOIN students stu ON stu.student_id = sc.student_id
WHERE asg.course_id = 2;

-- TASK 7 QUERY
-- Add an assignment to a course;
INSERT INTO assignments 
			(distribution_id,
            course_id,
            instance,					-- number of type of assignment. EX. Assignment 4 is the 3rd instance of a Lab
            possible_points)
VALUES (3,1,2,100);

-- TASK 8 QUERY
-- Change the percentages of the categories for a course;
UPDATE grade_distribution
SET percent = 45
WHERE course_id = 1 AND distribution_id = 1;

-- TASK 9 QUERY
-- Add 2 points to the score of each student on an assignment;
UPDATE student_scores
SET points = points + 2
WHERE assign_id = 9;

-- TASK 10 QUERY
-- Add 2 points just to those students whose last name contains a ‘Q’.

UPDATE student_scores
SET points = points + 2
WHERE assign_id = 34
	AND student_id = (
		SELECT student_id 
		FROM students
		WHERE lname LIKE '%Q%');

-- TASK 11 QUERY
-- Compute the grade for a student
SELECT 
	SUM((sc.points / asg.possible_points) * (gd.percent / c.num_inst)) AS final_grade
FROM student_scores sc 
LEFT JOIN assignments asg ON sc.assign_id = asg.assign_id 
JOIN grade_distribution gd ON gd.distribution_id = asg.distribution_id 
JOIN (
		SELECT 
			gd.distribution_id, 
            MAX(asg.instance) AS num_inst 
        FROM student_scores sc 
        LEFT JOIN assignments asg ON sc.assign_id = asg.assign_id 
        JOIN grade_distribution gd ON gd.distribution_id = asg.distribution_id 
        WHERE gd.course_id = 3 AND student_id = 1 
        GROUP BY gd.distribution_id) 
        c ON c.distribution_id = gd.distribution_id 
WHERE gd.course_id = 3 AND student_id = 1;

-- TASK 12 QUERY
-- Compute the grade for a student, where the lowest score for a given category is dropped.
SELECT SUM(
    IF(
        (gd.category = 'Project' AND sc.points / asg.possible_points <= lw.low), 
        gd.percent / c.counter, 
        (sc.points / asg.possible_points) * (gd.percent / c.counter)
    )
) AS final_grade
FROM student_scores sc 
LEFT JOIN assignments asg ON sc.assign_ID = asg.assign_ID 
JOIN grade_distribution gd ON gd.distribution_ID = asg.distribution_ID 
JOIN (SELECT gd.distribution_ID, COUNT(*) AS counter FROM student_scores sc 
        LEFT JOIN assignments asg ON sc.assign_ID = asg.assign_ID 
        JOIN grade_distribution gd ON gd.distribution_ID = asg.distribution_ID 
        WHERE gd.course_ID = 3 AND student_ID = 1 GROUP BY gd.distribution_ID) 
        c ON c.distribution_ID = gd.distribution_ID 
JOIN (SELECT gd.distribution_ID, MIN(sc.points / asg.possible_points) AS low FROM student_scores sc 
        LEFT JOIN assignments asg ON sc.assign_ID = asg.assign_ID 
        JOIN grade_distribution gd ON gd.distribution_ID = asg.distribution_ID 
        WHERE gd.course_ID = 3 AND student_ID = 1 GROUP BY gd.distribution_ID) 
        lw ON lw.distribution_ID = gd.distribution_ID 
WHERE gd.course_ID = 3 AND student_ID = 1;




