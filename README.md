# Student Course Enrollment Database 

## Overview:
The Student Course Enrollment Database is a  system designed to manage student information, course details, and enrollment records efficiently. This overview provides a detailed look at the database structure, data population, key functionalities, and usage of stored procedures.

## Database Structure:

### Students Table: 
Stores student details such as ID, first name, last name, birth date, contact number, email and address.
### Courses Table: 
It contains information about courses including ID, name and instructor.
### Module Table:
Stores details about modules within courses.
### Course_module Table: 
Establishes a many-to-many relationship between courses and modules.
### Enrollment Table: 
Records student enrollments with enrollment ID, student ID, course ID, enrollment date and status.

## Functionality:

### Data Manipulation: 
Users can manipulate data within the database, including updating student information, adding new courses, and managing enrollments.
### Stored Procedures:
insert_student: A stored procedure to insert new student records into the database.

enroll_student: A stored procedure to enroll students in courses by inserting enrollment records.
### View Creation:
A view named students_course_details is created to display comprehensive details of students' course enrollments.

## Conclusion:
The Student Course Enrollment Database provides a structured and efficient solution for managing student enrollments and course information. 
