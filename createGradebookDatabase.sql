-- creates the gradebook database and delets any existing one
DROP DATABASE IF EXISTS `gradebook`;
CREATE DATABASE `gradebook`; 
USE `gradebook`;

-- Creates the course table and if all already existing drops and recreates
DROP TABLE IF EXISTS `Courses`;
CREATE TABLE `Courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_dept` varchar(50) NOT NULL,
  `course_num` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
);

-- Inserts the default values of the course table
LOCK TABLES `courses` WRITE;
INSERT INTO `courses` 
VALUES (1,'English',20101,'English 101','Fall',2018),
	   (2,'Math',30367,'Linear Algebra','Spring',2017),
       (3,'Computer Science',40351,'Database Systems','Fall',2017),
       (4,'Biology',10236,'Genetics 1','Fall',2016),
       (5,'Health',60245,'Womens Health','Spring',2018),
       (6,'Theaters',50101,'Acting 101','Fall',2016);         
UNLOCK TABLES;

-- Creates the students table and if all already existing drops and recreates
DROP TABLE IF EXISTS `Students`;
CREATE TABLE `Students` (
  `student_id` int(11) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`student_id`)
);

-- Inserts the default values of the student table
LOCK TABLES `students` WRITE;
INSERT INTO `students` 
VALUES 	(1,'Tamang','Ashok','tamash07@gmail.com'),
		(2,'Potter','Harry','pothar01@yahoo.com'),
        (3,'Hathaway','Anna','annahath@aol.com'),
        (4,'Micheam','Hermoine','hmicheam@hogwarts.com'),
        (5,'Quack','Gauri','gquack@hotmail.com'),
        (6,'Ponting','Ricky','rickpont@live.com'),
        (7,'Williams','Serena','serena@tennis.com');        
UNLOCK TABLES;

-- Creates the assignments table and if all already existing drops and recreates
DROP TABLE IF EXISTS `assignments`;
CREATE TABLE `Assignments` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `possible_points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`assign_id`)
);

LOCK TABLES `assignments` WRITE;
INSERT INTO `assignments` 
VALUES 	-- Course 1 Dis IDs are 1-4
		(1,1,1,100),(2,1,2,100),(3,1,3,100),(4,1,4,50), 	-- Dis Id 1 = Test
        (5,2,1,100),(6,2,2,50),(7,2,3,50),        			-- ID 2 = Lab
        (8,3,1,75),        									-- ID 3 = Homework
        (9,4,1,75),(10,4,2,100),(11,4,3,75),(12,4,4,100),	-- ID 4 = Quiz
        
        -- Course 2 Dis IDs are 5-8 
        (13,5,1,50),(14,5,2,75),(15,5,3,200),        						-- Dis ID 5 = Test
        (16,6,1,100),(17,6,2,100),(18,6,3,100),(19,6,4,50),(20,6,5,50),   	-- ID 6 = Lab
        (21,7,1,100),(22,7,2,100),        									-- ID 7 = Homework
        (23,8,1,50),(24,8,2,50),(25,8,3,75),(26,8,4,100),(27,8,5,75),		-- ID 8 = Quiz
        
        -- Course 3 Dis IDs are 9-10
        (28,9,1,100), (29,9,2,75),        											-- Dis ID 9 = Project
        (30,10,1,100),(31,10,2,350),(32,10,3,100),(33,10,4,250),(34,10,5,150),		-- ID 10 = Homework
        
        -- Course 4 Dis IDs are 11-13
        (35,11,1,50),(36,11,2,75),(37,11,3,100),(38,11,4,100),(39,11,5,100),(40,11,6,100),		-- Dis ID 11 = Test
        (41,12,1,100),        																	-- ID 12 = Homework
        (42,13,1,50),(43,13,2,50),(44,13,3,50),													-- ID 13 = Project
        
        -- Course 5 Dis IDs are 14-17
        (45,14,1,75),        							-- Dis ID 14 = Test
        (46,15,1,500),(47,15,2,500),        			-- ID 15 = Lab
        (48,16,1,100),(49,16,2,200),(50,16,3,50), 		-- ID 16 = Project
        (51,17,1,50),(52,17,2,75),						-- ID 17 = Quiz
        
        -- Course 6 Dis IDs are 18-20
        (53,18,1,100),(54,18,2,100),        						-- Dis ID 18 = Test
        (55,19,1,100),(56,19,2,100),(57,19,3,100),        			-- ID 19 = Lab
        (58,20,1,100),(59,20,2,50),(60,20,3,150),(61,20,4,100);		-- ID 20 = Project
UNLOCK TABLES;


-- Creates the grade distribution table and if all already existing drops and recreates
DROP TABLE IF EXISTS `grade distribution`;
CREATE TABLE `Grade Distribution` (
  `distribution_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`distribution_id`)
);

-- Inserts the default values of the grade distribution table
LOCK TABLES `grade distribution` WRITE;
INSERT INTO `grade distribution` 
VALUES 	-- Course 1
		(1, 1, 'Test', 50), (2, 1, 'Lab', 10),     
		(3, 1, 'Homework', 25), (4, 1, 'Quiz', 15),
        
        -- Course 2
        (5, 2, 'Test', 15), (6, 2, 'Lab', 25),
		(7, 2, 'Homework', 45), (8, 2, 'Quiz', 15),
        
        -- Course 3
        (9, 3, 'Project', 40), (10, 3, 'Homework', 60),
        
        -- Course 4
        (11, 4, 'Test', 30), (12, 4, 'Homework', 30),
        (13, 4, 'Project', 40),
        
        -- Course 5
        (14, 5, 'Test', 40), (15, 5, 'Lab', 20),
        (16, 5, 'Project', 20), (17, 5, 'Quiz', 20),
        
        -- Course 6
        (18, 6, 'Test', 30), (19, 6, 'Lab', 40),
        (20, 6, 'Project', 30);
UNLOCK TABLES;


-- Creates the student scores table and if all already existing drops and recreates
DROP TABLE IF EXISTS `student scores`;
CREATE TABLE `Student Scores` (
  `student_id` int(11) NOT NULL,
  `assign_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_id`, `assign_id`)
);

-- Inserts the default values of the student score table
LOCK TABLES `student scores` WRITE;
INSERT INTO `student scores` 
VALUES  -- STUDENT 1 = Enrolled in 5 out of the 6 courses
		(1,9,75),(1,10,100),(1,11,74),(1,12,99), 				-- Course 1 Work Assign ID = 1-12        
        (1,21,100),(1,22,95),(1,23,49),(1,24,49),				-- Course 2 Work Assign ID = 12 - 27
        (1,25,75),(1,26,100),(1,27,73),        
        (1,28,100),(1,29,75),(1,30,100),(1,31,350),(1,32,100),	-- Course 3 Work Assign ID = 28 - 34
        (1,33,249),(1,34,150),        
		-- Not Enrolled in Course 4								-- Course 4 Work Assign Id = 35 - 44          
        (1,46,500),(1,47,499),(1,51,50),(1,52,50),				-- Course 5 work Assign ID = 45 - 52        
        (1,53,74),(1,54,100), (1,55,100),(1,56,100),(1,57,99), 	-- Course 6 Work Assign Id = 53 - 61
        
        
        -- STUDENT 2
        (2,8,65),(2,9,65),(2,10,76),(2,11,38),(2,12,20), 		-- Course 1 Work Assign ID = 1 - 12
        -- Not Enrolled in Course 2								-- Course 2 Work Assign ID = 12 - 27
        -- Not Enrolled in Course 3								-- Course 3 Work Assign ID = 28 - 34
        (2,42,50),(2,43,50),(2,44,50),							-- Course 4 Work Assign Id = 35 - 44  
        (2,48,100),(2,49,200),(2,50,35),(2,51,40),(2,52,75),	-- Course 5 work Assign ID = 45 - 52
        -- Not Enrolled in Course 6       						-- Course 6 Work Assign Id = 53 - 61
        
        
        -- STUDENT 3
        -- Not Enrolled in Course 1								-- Course 1 Work Assign ID = 1 - 12
        (3,23,35),(3,24,35),(3,25,60),(3,26,60),(3,27,50), 		-- Course 2 Work Assign ID = 12 - 27
        (3,28,80),(3,29,50),									-- Course 3 Work Assign ID = 28 - 34
        -- Not Enrolled in Course 4								-- Course 4 Work Assign Id = 35 - 44 
        (3,55,93),(3,56,90),(3,57,96),							-- Course 5 work Assign ID = 45 - 52
        -- Not Enrolled in Course 6								-- Course 6 Work Assign Id = 53 - 61
        
        
        -- STUDENT 4
        (4,1,82),(4,2,78),(4,3,85),(4,4,42),(4,5,78),			-- Course 1 Work Assign ID = 1 - 12
        (4,6,41),(4,7,40),
        (4,13,40),(4,14,60),(4,15,164),(4,16,80),(4,17,74),		-- Course 2 Work Assign ID = 12 - 27
        (4,18,86),(4,19,48),(4,20,32),        
        (4,30,88),(4,31,300),(4,32,72),(4,33,200),(4,34,130),	-- Course 3 Work Assign ID = 28 - 34
        (4,35,40),(4,36,64),(4,37,80),(4,38,80),(4,39,83),		-- Course 4 Work Assign Id = 35 - 44
        (4,40,77),
        (4,45,65),(4,46,425),(4,47,375),						-- Course 5 work Assign ID = 45 - 52
        (4,53,89),(4,54,71),(4,58,90),(4,59,35),(4,60,125),		-- Course 6 Work Assign Id = 53 - 61
        (4,61,80),
        
        
        -- STUDENT 5
        -- Not Enrolled in Course 1 							-- Course 1 Work Assign ID = 1 - 12
        -- Not Enrolled in Course 2								-- Course 2 Work Assign ID = 12 - 27
        (5,30,70),(5,31,200),(5,32,50),(5,33,180),(5,34,100),	-- Course 3 Work Assign ID = 28 - 34
        -- Not Enrolled in Course 4								-- Course 4 Work Assign Id = 35 - 44
        (5,46,400),(5,47,300),									-- Course 5 work Assign ID = 45 - 52
        (5,53,70),(5,54,65),									-- Course 6 Work Assign Id = 53 - 61
        
        
        -- STUDENT 6
        (6,1,100),(6,2,80),(6,3,83),(6,4,0),(6,5,0),(6,6,50),	-- Course 1 Work Assign ID = 1 - 12
        (6,7,40),(6,8,50),
        (6,16,57),(6,17,58),(6,18,55),(6,19,50),(6,20,50),		-- Course 2 Work Assign ID = 12 - 27
        -- Not Enrolled in Course 3								-- Course 3 Work Assign ID = 28 - 34
        (6,42,35),(6,43,35),(6,44,40),							-- Course 4 Work Assign Id = 35 - 44
        (6,45,70),(6,48,100),(6,50,42),							-- Course 5 work Assign ID = 45 - 52
        -- Not Enrolled in Course 6								-- Course 6 Work Assign Id = 53 - 61
        
        -- STUDENT 7
        -- Not Enrolled in Course 1								-- Course 1 Work Assign ID = 1 - 12
        -- Not Enrolled in Course 2								-- Course 2 Work Assign ID = 12 - 27
        (7,30,25),(7,31,125),(7,32,30),(7,33,100),(7,34,0),		-- Course 3 Work Assign ID = 28 - 34
        -- Not Enrolled in Course 4								-- Course 4 Work Assign Id = 35 - 44
        (7,46,300),(7,47,275),									-- Course 5 work Assign ID = 45 - 52
        (7,53,45),(7,54,78);									-- Course 6 Work Assign Id = 53 - 61
UNLOCK TABLES;

