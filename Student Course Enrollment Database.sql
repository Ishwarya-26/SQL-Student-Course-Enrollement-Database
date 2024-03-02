-- Creating a new database
CREATE DATABASE student_database;
USE student_database;

-- Creating student table
CREATE TABLE students
(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
birth_date DATE,
contact_number VARCHAR(50),
email_id VARCHAR(50),
address VARCHAR(300)
);

-- Creating courses table
CREATE TABLE courses
(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100),
course_instructor VARCHAR(50)
);

-- Creating modules table
CREATE TABLE module
(
module_id INT AUTO_INCREMENT PRIMARY KEY,
module_name VARCHAR(100)
);

-- Creating course_module table
CREATE TABLE course_module
(
course_id INT,
module_id INT,
PRIMARY KEY (course_id,module_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id),
FOREIGN KEY(module_id) REFERENCES module(module_id)
); 

-- Creating enrollemnt table 
CREATE TABLE enrollment
(
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
status VARCHAR(20),
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Inserting data into course table
INSERT INTO courses(course_id,course_name,course_instructor)
VALUES
(1,'Data Analytics','Alex Freberg'),
(2,'Data Science','John Bill'),
(3,'Full Stack Development','James Smith');

-- Inserting data into module table
INSERT INTO module(module_id,module_name)
VALUES
(1,'SQL'),
(2,'Excel'),
(3,'Power BI'),
(4,'Python'),
(5,'Python'),
(6,'Statistics and Probabilty'),
(7,'Machine Learniextract_table_from_file_nameng'),
(8,'Artificial Intelligence'),
(9,'Deep Learning'),
(10,'HTML'),
(11,'CSS'),
(12,'Java Script'),
(13,'ReactJS'),
(14,'NodeJS'),
(15,'MangoDB'),
(16,'Python');

-- Inserting data into course_module table
INSERT INTO course_module(course_id,module_id)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(2,7),
(2,8),
(2,9),
(3,10),
(3,11),
(3,12),
(3,14),
(3,15),
(3,16);

-- Inserting data into students table
INSERT INTO students(student_id,first_name,last_name,birth_date,contact_number,email_id,address)
VALUES
(1,'Robert','Hook','2002-11-11','9876543210','roberthook@gmail.com','44,brook Street,town,USA'),
(2,'Bae','Suzy','2003-12-12','1234567890','baesuzy@gmail.com','123,main street,Hometown,USA'),
(3,'Karina','Kapoor','2021-05-09','2563985656','karinakapoor@yahoo.com','NO.4,mirror road,Austin,USA'),
(4,'Eric','Nam','2000-01-20','4672301112','ericnam26@gmail.com','3,my house street,newyork,USA');

-- Inserting data into enrollment table
INSERT INTO enrollment(enrollment_id,student_id,course_id,enrollment_date,status)
VALUES
(1,1,2,'2023-01-05','Completed'),
(2,2,1,'2023-05-30','Learning'),
(3,3,3,'2023-07-24','Dropped'),
(4,4,1,'2023-08-26','Completed');

SELECT * FROM students;

-- Wrong date of birth for student id 3
-- Updating the dob for student_id 3
UPDATE students
SET birth_date='2001-05-09'
WHERE student_id=3;

--  Creating view 
CREATE VIEW students_course_details AS 
SELECT 
s.student_id,
s.first_name,
s.last_name,
c.course_name,
e.enrollment_date,
e.status
FROM students s
JOIN
enrollment e ON e.student_id= s.student_id
JOIN
courses c ON e.course_id=c.course_id;

-- Viewing the students course details
SELECT * FROM students_course_details;

-- Inserting student data using stored procedure
CALL insert_student('James','Bond','1999-09-27','9898989898','jamesbond123@gmail.com','NO.111,waterfall street,newyork,USA');

-- creating stored procedure for enrollment
DELIMITER //

CREATE PROCEDURE enroll_student(
    IN student_id INT,
    IN course_id INT,
    IN enrollment_date DATE,
    IN status VARCHAR(20)
)
BEGIN
    INSERT INTO enrollment(student_id, course_id, enrollment_date, status)
    VALUES (student_id, course_id, enrollment_date, status);
END //

DELIMITER ;

-- Inserting enrollment data
CALL enroll_student(5,2,'2023-10-20','Learning');


SELECT * FROM enrollment;

