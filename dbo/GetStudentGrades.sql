CREATE FUNCTION GetStudentGrades (@StudentID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        SU.Subject_Name AS SubjectName,
        G.Grades AS Grade,
        SD.Name AS StudiesName,
        U.First_Name AS FirstName,
        U.Last_Name AS LastName
    FROM
        Grades G
    JOIN
        Students ST ON G.Student_ID = ST.Student_ID
    JOIN
        Users U ON ST.Student_ID = U.User_ID
    JOIN
        Studies S ON G.Studies_ID = S.Studies_ID
    JOIN
        Studies_Details SD ON S.Studies_ID = SD.Studies_ID
    JOIN
        Subjects SU ON G.Subject_ID = SU.Subject_ID
    WHERE
        G.Student_ID = @StudentID

)
go

