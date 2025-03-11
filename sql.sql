
-- PROJECT TITLE : COLLEGE MANAGEMENT STSTEM
-- ====================================================

-- DATABASE SCHEMA
-- Database Name : College_db
            
		CREATE DATABASE College_db;
		USE College_db;
					
-- CREATING TABLES & INSERTING SAMPLE DATA

-- 1.Student Table stores each student details
		
        CREATE TABLE Student (
			std_id INT PRIMARY KEY AUTO_INCREMENT,
			std_First_Name VARCHAR(50) NOT NULL,
			std_Last_Name VARCHAR(50) NOT NULL,
			DOB DATE NOT NULL,
			Age INT,
			Gender varchar(10) NOT NULL,
			ph_no bigint UNIQUE NOT NULL,
			Address VARCHAR(255),
			Email VARCHAR(100) UNIQUE NOT NULL,
			dept_id INT,
			FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
		);
        
-- STUDENT DATA

        INSERT INTO Student (std_First_Name, std_Last_Name, DOB, Age, Gender, ph_no, Address, Email, dept_id) 
        VALUES
			('John', 'Doe', '2002-05-15', 22, 'Male', '9876543211', '123 Main St, NY', 'john.doe@example.com', 1),
			('Emma', 'Smith', '2003-08-22', 21, 'Female', '9123236389', '456 Elm St, CA', 'emma.smith@example.com', 2),
			('Michael', 'Johnson', '2001-12-10', 23, 'Male', '9234467890', '789 Oak St, IL', 'michael.johnson@example.com', 3),
			('Sophia', 'Brown', '2004-03-18', 20, 'Female', '9345638901', '101 Pine St, TX', 'sophia.brown@example.com', 4),
			('William', 'Davis', '2002-07-05', 22, 'Male', '9456782012', '222 Cedar St, FL', 'william.davis@example.com', 1),
			('Olivia', 'Wilson', '2003-09-25', 21, 'Female', '9567990123', '333 Birch St, WA', 'olivia.wilson@example.com', 2),
			('James', 'Martinez', '2000-11-30', 24, 'Male', '9678951234', '444 Maple St, AZ', 'james.martinez@example.com', 3),
			('Isabella', 'Garcia', '2001-04-12', 23, 'Female', '9749012345', '555 Walnut St, NV', 'isabella.garcia@example.com', 4),
			('Ethan', 'Rodriguez', '2002-06-20', 22, 'Male', '9890523456', '666 Aspen St, CO', 'ethan.rodriguez@example.com', 1),
			('Ava', 'Lopez', '2004-01-08', 20, 'Female', '9901234577', '777 Spruce St, GA', 'ava.lopez@example.com', 2),
			('Alexander', 'Hernandez', '2003-05-14', 21, 'Male', '8012345678', '888 Fir St, NJ', 'alexander.hernandez@example.com', 3),
			('Mia', 'Gonzalez', '2001-08-23', 23, 'Female', '9123466789', '999 Redwood St, OR', 'mia.gonzalez@example.com', 4),
			('Benjamin', 'Clark', '2000-10-05', 24, 'Male', '9234517890', '111 Sequoia St, MI', 'benjamin.clark@example.com', 1),
			('Charlotte', 'Lewis', '2003-02-17', 21, 'Female', '9325678901', '222 Chestnut St, OH', 'charlotte.lewis@example.com', 2),
			('Daniel', 'Walker', '2002-07-29', 22, 'Male', '9456783012', '333 Willow St, PA', 'daniel.walker@example.com', 3),
			('Amelia', 'Hall', '2004-11-11', 20, 'Female', '9567894123', '444 Dogwood St, TN', 'amelia.hall@example.com', 4),
			('Matthew', 'Young', '2001-03-25', 23, 'Male', '9678909234', '555 Magnolia St, SC', 'matthew.young@example.com', 1),
			('Harper', 'Allen', '2003-06-09', 21, 'Female', '9789082345', '666 Cypress St, MO', 'harper.allen@example.com', 2),
			('David', 'King', '2000-09-14', 24, 'Male', '9890123457', '777 Hickory St, VA', 'david.king@example.com', 3),
			('Evelyn', 'Scott', '2002-12-30', 22, 'Female', '9901235567', '888 Sycamore St, MN', 'evelyn.scott@example.com', 4);
            
-- 2.Department Table stores each department details
   
		CREATE TABLE Department (
			dept_id INT PRIMARY KEY AUTO_INCREMENT,
			dept_name VARCHAR(100) UNIQUE NOT NULL,
			HOD VARCHAR(100)
		  );
        
-- DEPARTMENT DATA
        INSERT INTO Department (dept_name, HOD) VALUES
			('Computer Science', 'Dr. John Smith'),
			('Information Technology', 'Dr. Emily Johnson'),
			('Electrical Engineering', 'Dr. Robert Brown'),
			('Mechanical Engineering', 'Dr. Sarah White');
            

-- 3.Course Table stores each course details

		CREATE TABLE Course (
			Course_id INT PRIMARY KEY AUTO_INCREMENT,
		    Course_name VARCHAR(100) NOT NULL,
			dept_id INT,
			Credits INT NOT NULL,
			FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
		);
        
-- COURSE DATA
	    INSERT INTO Course (course_name, dept_id, credits) VALUES
			('Database Management', 1, 4),
			('Artificial Intelligence', 1, 3),
			('Cyber Security', 2, 3),
			('Digital Electronics', 3, 4),
			('Thermodynamics', 4, 4);

-- 4.Faculty Table stores each faculty details

		CREATE TABLE Faculty (
		    Faculty_id INT PRIMARY KEY AUTO_INCREMENT,
			Faculty_First_Name VARCHAR(50) NOT NULL,
			Faculty_Last_Name VARCHAR(50) NOT NULL,
			Ph_no VARCHAR(15) UNIQUE NOT NULL,
			Email VARCHAR(100) UNIQUE NOT NULL,
			dept_id INT,
            Designation VARCHAR(50),
			FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
		);
        
-- FACULTY DATA
	    INSERT INTO Faculty (faculty_First_Name, faculty_Last_Name, ph_no, Email, dept_id, designation) VALUES
   			('Robert', 'Williams', '9871234567', 'robert.williams@example.com', 1, 'Professor'),
			('Linda', 'Clark', '8765432198', 'linda.clark@example.com', 2, 'Assistant Professor'),
			('James', 'White', '7654321987', 'james.white@example.com', 3, 'Lecturer'),
			('Patricia', 'Taylor', '6543219876', 'patricia.taylor@example.com', 4, 'Professor');
	
-- 5.Assign Faculty to Courses

		CREATE TABLE Faculty_Course (
			fc_id INT PRIMARY KEY AUTO_INCREMENT,
			faculty_id INT,
			course_id INT,
			FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id) ON DELETE CASCADE,
			FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE
		);
                  
-- FACULTY COURSE DATA
        INSERT INTO Faculty_Course (faculty_id, course_id) VALUES
			(1, 1),
			(2, 2),
			(3, 3),
			(4, 4),
			(1, 5);		

-- Retrieve all details of Particular Table
		SELECT * FROM Student;
		SELECT * FROM Department;		
		SELECT * FROM Course;		
		SELECT * FROM Faculty;		
		SELECT * FROM Faculty_course;
		
-- QUERIES        
        
-- *********************** BASIC QUERIES ***********************
        
-- 1.	Retrieve all details of students.
		SELECT * FROM Student;
 
-- 2.	Get the names and emails of all faculty members. 
		SELECT Faculty_First_Name, Faculty_Last_Name, Email
		FROM faculty;
    
-- 3.	Find the total number of students in the college. 
		SELECT count(*) FROM student;
          
-- 4.	Retrieve all courses with their credit values. 
		SELECT Course_name , Credits
        FROM course;
        
-- 5.	Get the youngest student in the college.
		SELECT * FROM student
        ORDER BY DOB 
        LIMIT 1;
        
-- 6.   Find students who are older than 22 years. 
		SELECT * 
        FROM student
        WHERE Age > 22;
        
-- 7.	List the names of students in alphabetical order.
        SELECT std_First_Name , std_Last_Name
        FROM student
        ORDER BY std_First_Name;
        
-- 8.	Find students born after 2003. 
		SELECT std_id , std_First_Name , std_Last_Name , DOB 
        FROM student
        WHERE DOB > '2003-12-31';
        
-- 9.	List students who live in 'New York'. 
		SELECT * FROM student
        WHERE Address LIKE '%NY%';
        
-- 10.	Get courses with the highest credit value.
        SELECT Course_id, Course_name, Credits
		FROM course
		WHERE Credits = (SELECT MAX(Credits) FROM course);
        
-- *********************** INTERMEDIATE & COMPLEX QUERIES ***********************
        
-- 11.	Retrieve faculty members along with the courses they are teaching. 
		SELECT Faculty_id, Concat(Faculty_First_Name ,' ', Faculty_Last_Name) AS Full_Name , Course_name 
        FROM faculty 
        JOIN course
        ON faculty.dept_id = course.dept_id;

-- 12.	Find all courses in the 'Computer Science' department.
		SELECT Course_name , dept_name
        FROM course
        JOIN Department
        ON course.dept_id = Department.dept_id
        WHERE dept_name='Computer Science';
        
-- 13.	Retrieve faculty members along with the courses they are teaching. 
		SELECT Faculty_id, Concat(Faculty_First_Name ,' ', Faculty_Last_Name) AS Full_Name , Course_name 
        FROM faculty 
        JOIN course
        ON faculty.dept_id = course.dept_id;
        
-- 14.	Count the number of male and female students. 
		SELECT Gender , count(Gender) FROM student
        GROUP BY Gender;
        
-- 15.  Find students who are in the Computer Science or IT department and are older than 22 years
		SELECT std_id , std_First_Name , std_Last_Name , dept_name , Age
        FROM student
        JOIN Department 
        ON student.dept_id = Department.dept_id
        WHERE ( dept_name = 'Computer Science' OR dept_name = 'Information Technology' ) AND Age > 22;

-- 16.	Find the department where the average student age is the highest.
		SELECT dept_name , AVG(Age)
        FROM student
        JOIN Department
        ON student.dept_id = Department.dept_id
        GROUP BY dept_name
		ORDER BY AVG(Age) DESC
        LIMIT 1;
 
-- 17.	Find students enrolled in 'Database Management'. 
		SELECT std_id, std_First_Name, std_Last_Name, Course_name
        FROM student
        JOIN course
        ON student.dept_id  = course.dept_id
        WHERE Course_name = 'Database Management';
        
-- 18.	Retrieve students who are NOT in the Electrical or Mechanical department
-- 	    and are either younger than 21 or older than 23
		SELECT std_id, std_First_Name, std_Last_Name , Age , dept_name
        FROM student
        JOIN Department
        ON student.dept_id = Department.dept_id
        WHERE dept_name NOT IN ('Electrical Engineering' , 'Mechanical Engineering') 
        AND (Age > 23 OR Age <21);
        
        -- --OR----
        
        SELECT std_id, std_First_Name, std_Last_Name , Age , dept_name
        FROM student
        JOIN Department
        ON student.dept_id = Department.dept_id
        WHERE (dept_name != 'Electrical Engineering' AND dept_name != 'Mechanical Engineering') 
        AND (Age > 23 OR Age <21);
        
-- 19.	Find students who are not enrolled in any course.
		SELECT std_id , std_First_Name , std_Last_Name 
        FROM student
        JOIN course
        ON student.dept_id = course.dept_id
        WHERE student.dept_id != course.dept_id;
        
        -- THERE ARE NO STUDENTS WHO ARE NOT ENROLLED IN ANY COURSE , ALL ARE ENROLLED IN PARTICULAR COURSE
               
-- 20.	Find faculty who are Professors but NOT in the Computer Science department
		SELECT Faculty_id , CONCAT(Faculty_First_Name,' ',Faculty_Last_Name) AS Faculty_Name , Designation , dept_name
        FROM faculty
        JOIN Department
        ON faculty.dept_id = Department.dept_id
        WHERE (Designation = 'Professor') AND (dept_name != 'Computer Science');
        
-- 21.	Retrieve courses that are not assigned to any faculty.
		SELECT Course_name , Faculty_id , CONCAT(Faculty_First_Name,' ',Faculty_Last_Name) AS Faculty_Name FROM course
        INNER JOIN faculty
        ON course.dept_id = faculty.dept_id
        WHERE Faculty_id IS NULL;

        -- For All Courses the faculty is assigned so that we have null values

-- 22.	Get students who are either 21 or 22 years old but NOT in the IT department
		SELECT std_id , std_First_Name , std_Last_Name , Age , dept_name
        FROM student
        JOIN Department
        ON student.dept_id = Department.dept_id
        WHERE (Age = 21 OR Age = 22) AND dept_name <> 'Information Technology';

-- 23.	Find the department with the highest number of students.
		SELECT  dept_name , count(std_id)
        FROM student
        INNER JOIN Department
        ON student.dept_id = Department.dept_id
        GROUP BY dept_name
        ORDER BY count(std_id) Desc
        LIMIT 1;
 
-- 24.	Get the list of students who have the same last name. 
		SELECT std_Last_Name, COUNT(*) AS count
		FROM student
		GROUP BY std_Last_Name
		HAVING COUNT(*) > 1;

         -- "THERE ARE NO STUDENTS WITH SAME LAST NAME"

-- 25.	Find courses that belong to the IT department OR have more than 3 credits, but NOT both
		SELECT Course_name , dept_name , Credits
        FROM course 
        JOIN Department 
        ON course.dept_id = Department.dept_id
        WHERE (dept_name = 'Electrical Engineering' OR Credits >3) 
        AND NOT (dept_name = 'Electrical Engineering' OR Credits >3);
 
-- 26.	Find students enrolled in at least 2 courses.
		SELECT std_id , COUNT(Course_id)  FROM student
        INNER JOIN course
        ON student.dept_id = course.dept_id
        GROUP BY std_id
        Having COUNT(Course_id) >= 2;
        
-- 27.	Find the percentage of male and female students.
        SELECT gender, 
        ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM student)), 2) AS percentage
		FROM student
		GROUP BY gender;
        
-- 28.	Find the top 3 students with the highest Credits.
        SELECT std_id , std_First_Name , std_Last_Name , SUM(Credits)
        FROM student
        INNER JOIN course
        ON student.dept_id = course.dept_id
        GROUP BY std_id
        ORDER BY SUM(Credits) DESC
        LIMIT 3;
        
-- 29.  Find the department with the lowest number of faculty members.
		SELECT  dept_name ,  COUNT(Faculty_id) AS Faculty 
		FROM Department
		INNER JOIN faculty
		ON Department.dept_id = faculty.dept_id
		GROUP BY dept_name
		ORDER BY COUNT(Faculty_id) ASC;
         
        -- THE ABOVE QUERY RESULTS WITH TH DEPARTMENT NAMES --         
         
		SELECT dept_id , COUNT(Faculty_id) FROM faculty
		GROUP BY dept_id;
        
        -- THE ABOVE QUERY RESULTS WITH TH DEPARTMENT ID -- 

-- 30.	Find students who are in the same department as ‘John Doe’
        SELECT std_id , std_First_Name , std_Last_Name , dept_id 
		FROM student 
		WHERE dept_id = (SELECT dept_id 
						 FROM student 
						 WHERE std_First_Name = 'John' AND std_Last_Name = 'Doe'  
						);
						 
