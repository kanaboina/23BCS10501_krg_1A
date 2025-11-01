

/*
Medium-Level Problem
Problem Title: Department-Course Subquery and Access Control
Procedure (Step-by-Step):

Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.

Insert five departments and at least ten courses across those departments.

Use a subquery to count the number of courses under each department.

Filter and retrieve only those departments that offer more than two courses.

Grant SELECT-only access on the courses table to a specific user.

Sample Output Description:

The result shows the names of departments which are associated with more than two courses in the system.
*/

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);

Select DeptID, (select count(*) from course where course.DeptID=Department.DeptID)
from Department;

SELECT DEPT_NAME
FROM DEPARTMENT
WHERE DEPTID IN (
    SELECT DEPTID
    FROM COURSE
    GROUP BY DEPTID
    HAVING COUNT(*) > 2
);









