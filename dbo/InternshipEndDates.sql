CREATE VIEW InternshipEndDates AS
SELECT
    I.Internship_ID AS InternshipID,
    I.Studies_ID AS StudyID,
    SD.Name AS StudyName,
    I.Start_Date AS StartDate,
    DATEADD(DAY, 14, I.Start_Date) AS EndDate
FROM
    Internship I
JOIN
    Studies S ON I.Studies_ID = S.Studies_ID
JOIN
    Studies_Details SD ON S.Studies_ID = SD.Studies_ID
go

