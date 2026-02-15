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