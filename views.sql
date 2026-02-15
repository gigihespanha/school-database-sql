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
--JOIN: Discipline + Professor
SELECT 
d.DisciplineDescription,
d.Schedule,
p.FullName AS ProfessorName,
p.City
FROM Discipline d
INNER JOIN Professor p
	ON d.ProfessorID = p.ProfessorID;