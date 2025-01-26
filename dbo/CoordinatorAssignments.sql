CREATE VIEW CoordinatorAssignments AS
SELECT
    SD.Studies_ID AS StudyID,
    SD.Name AS StudyName,
    E.Employee_ID AS CoordinatorID,
    CONCAT(E.First_Name, ' ', E.Last_Name) AS CoordinatorName,
    P.Position_Name AS CoordinatorPosition
FROM
    Studies_Details SD
JOIN
    Employees E ON SD.Coordinator_ID = E.Employee_ID
JOIN
    Position P ON E.Position_ID = P.Position_ID
JOIN
    Studies S ON SD.Studies_ID = S.Studies_ID
go

