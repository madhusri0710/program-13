-- Create Department table
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);
-- Create Course table
CREATE TABLE Course (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID)
);
-- Create Faculty table
CREATE TABLE Faculty (
FacultyID INT PRIMARY KEY,
FacultyName VARCHAR(50),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID)
);
-- Create Student table
CREATE TABLE Student (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
CourseID INT,
FacultyID INT,
FOREIGN KEY (CourseID)
REFERENCES Course(CourseID),
FOREIGN KEY (FacultyID)
REFERENCES Faculty(FacultyID)
);
-- Insert Department details
INSERT INTO Department VALUES
(1, &#39;Computer Science&#39;),
(2, &#39;Commerce&#39;);
-- Insert Course details
INSERT INTO Course VALUES
(101, &#39;BCA&#39;, 1),
(102, &#39;BCom&#39;, 2);

-- Insert Faculty details
INSERT INTO Faculty VALUES
(201, &#39;Dr. Kumar&#39;, 1),
(202, &#39;Dr. Ravi&#39;, 2);
-- Insert Student details
INSERT INTO Student VALUES
(1, &#39;Arun&#39;, 101, 201),
(2, &#39;Priya&#39;, 101, 201),
(3, &#39;Rahul&#39;, 102, 202);
-- Display normalized student details
SELECT
s.StudentID,
s.StudentName,
c.CourseName,
f.FacultyName,
d.DepartmentName
FROM Student s
JOIN Course c
ON s.CourseID = c.CourseID
JOIN Faculty f
ON s.FacultyID = f.FacultyID
JOIN Department d
ON c.DepartmentID = d.DepartmentID;
