USE gradebook;
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
WHERE asg.course_id = 2

