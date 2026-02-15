SELECT * FROM Student;
SELECT * FROM Professor;
SELECT * FROM Discipline;

--TEST THE VIEW
SELECT * FROM dbo.vw_DisciplineDetails;

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