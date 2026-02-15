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
