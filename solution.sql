-- Create Database
CREATE DATABASE deepakDB;

-- Use Database
USE deepakDB;

-- Create Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert Department Records
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics');


-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Insert Student Records
INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 102),
(1003, 'Karthik', 101),
(1004, 'Nisha', 103);


-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Insert Course Records
INSERT INTO Course (CourseID, CourseName)
VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');


-- Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Enrollment Records
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201);


-- Create View
CREATE VIEW StudentDetails AS
SELECT
    s.StudentName,
    c.CourseName,
    d.DepartmentName
FROM Student s
INNER JOIN Department d
    ON s.DepartmentID = d.DepartmentID
INNER JOIN Enrollment e
    ON s.StudentID = e.StudentID
INNER JOIN Course c
    ON e.CourseID = c.CourseID;


-- Display View
SELECT * FROM StudentDetails;

