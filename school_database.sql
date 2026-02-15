--SCHOOL DATABASE PROJECT (SSMS / SQL Server)
-- Author: Giovanna Hespanha
--Description:
     -- Database creation
     -- Tables with primary and foreign keys
     -- Sample data insertion
     -- Queries with JOIN, WHERE, ORDER BY
     -- View creation

CREATE DATABASE School; --create database (run only once)

USE School; --use database


--CREATE TABLES (safe to re-run)
--(drop and recreate to avoid "already exists")

DROP TABLE IF EXISTS Discipline; -- drop it first because it has a foreign key
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
	StudentID INT NOT NULL PRIMARY KEY,
	FullName VARCHAR(50) NULL,
	StudentAddress VARCHAR(100) NULL,
	City VARCHAR(50) NULL,
	--BirthDate DATE NULL,
	EnrollmentDate DATE NULL,
	FatherName VARCHAR(50) NULL,
	MotherName VARCHAR(50) NULL
	);

CREATE TABLE Professor (
		ProfessorID INT NOT NULL PRIMARY KEY,
		FullName VARCHAR(50) NULL,
		ProfessorAddress VARCHAR(100) NULL,
		City VARCHAR(50) NULL,
		HireDate DATE NULL
		);

CREATE TABLE Discipline (
		DisciplineID INT NOT NULL PRIMARY KEY,
		ProfessorID INT NOT NULL,
		DisciplineDescription VARCHAR(50) NULL,
		CreatedDate DATE NULL,
		Schedule VARCHAR(50) NULL,
		CONSTRAINT FK_Discipline_Professor
			FOREIGN KEY (ProfessorID)
			REFERENCES Professor(ProfessorID)
		);

--INSERT SAMPLE DATA

--Students
INSERT INTO Student (StudentID, FullName, StudentAddress, City, EnrollmentDate, FatherName, MotherName) VALUES 
(970668131,'Lucas Pereira','456 Main St','Orlando','2024-08-01','Carlos Pereira','Fernanda Pereira'),
(970668133, 'Maria Santos','789 Pine St','Miami','2024-08-01','Joao Santos','Ana Santos');

INSERT INTO Professor (ProfessorID, FullName, ProfessorAddress, City, HireDate) VALUES
(1,'Robin Williams','100 Campus Rd','Orlando','2020-08-01'),
(2,'Carol Martins','200 College Ave','Miami','2023-08-01');

INSERT INTO Discipline (DisciplineID, ProfessorID, DisciplineDescription, CreatedDate, Schedule) VALUES
(2341,1,'Database Systems','2024-01-10','M/W 9:30'),
(3568,2,'Data Analytics','2024-02-05','T/TR 13:00');

SELECT * FROM Student;
SELECT * FROM Professor;
SELECT * FROM Discipline;

--JOIN: Discipline + Professor
SELECT 
d.DisciplineDescription,
d.Schedule,
p.FullName AS ProfessorName,
p.City
FROM Discipline d
INNER JOIN Professor p
	ON d.ProfessorID = p.ProfessorID;

--Optional Filter examples:
--WHERE p.City = 'Orlando'
--WHERE d.DisciplineDescription = 'Database Systems'
SELECT *
FROM Professor
WHERE City = 'Orlando';

--ORDER BY (example:students ordered by name)
SELECT *
FROM Student
ORDER BY FullName;

--CREATE OR ALTER VIEW: DisciplineDetails
CREATE OR ALTER VIEW dbo.vw_DisciplineDetails AS
SELECT
	d.DisciplineID,
	d.DisciplineDescription,
	d.Schedule,
	p.FullName AS ProfessorName,
	p.City
	FROM dbo.Discipline d
	INNER JOIN dbo.Professor p
		ON d.ProfessorID = p.ProfessorID;

--TEST THE VIEW
SELECT * FROM dbo.vw_DisciplineDetails;