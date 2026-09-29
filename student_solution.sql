USE CollegeDB;

-- 1. Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- 2. Faculty Table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- 3. Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FacultyID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

-- 4. Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- 5. StudentCourse Table
CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- Department: exactly 2 records
INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Commerce');

-- Faculty: exactly 2 records
INSERT INTO Faculty VALUES
(201, 'Ravi', 101),
(202, 'Priya', 102);

-- Course: exactly 3 records
INSERT INTO Course VALUES
(301, 'Database Management System', 101, 201),
(302, 'Python Programming', 101, 201),
(303, 'Accounting', 102, 202);

-- Student: exactly 3 records
INSERT INTO Student VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 101),
(1003, 'Karthik', 102);

-- StudentCourse: exactly 4 records
INSERT INTO StudentCourse VALUES
(1001, 301),
(1001, 302),
(1002, 301),
(1003, 303);
