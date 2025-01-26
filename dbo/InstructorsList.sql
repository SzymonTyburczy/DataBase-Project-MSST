CREATE VIEW InstructorsList AS
SELECT
    E.Employee_ID AS InstructorID,
    CONCAT(E.First_Name, ' ', E.Last_Name) AS InstructorName,
    P.Position_Name AS PositionName
FROM Employees E
JOIN Position P ON E.Position_ID = P.Position_ID
WHERE P.Position_Name = 'Instructor'
go

