CREATE VIEW StudentsInternshipStatus AS
SELECT
    U.User_ID AS StudentID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS StudentName,
    S.Studies_ID AS StudiesID,
    SD.Name AS StudiesName,
    I.Start_Date AS InternshipStartDate,
    CASE
        WHEN SI.Completion = 1 THEN 'Completed'
        ELSE 'Not Completed'
    END AS CompletionStatus
FROM Student_Internship SI
JOIN Internship I ON SI.Internship_ID = I.Internship_ID
JOIN Studies S ON I.Studies_ID = S.Studies_ID
JOIN Studies_Details SD ON S.Studies_ID = SD.Studies_ID
JOIN Students ST ON SI.Student_ID = ST.Student_ID
JOIN Users U ON ST.Student_ID = U.User_ID
go

