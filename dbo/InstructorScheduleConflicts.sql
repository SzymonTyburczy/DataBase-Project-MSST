CREATE VIEW InstructorScheduleConflicts AS
WITH CombinedSchedules AS (
    SELECT
        E.Employee_ID AS InstructorID,
        'Course' AS EventType,
        C.Name AS EventName,
        CM.Date AS EventDate,
        CM.Duration AS EventDuration,
        DATEADD(MINUTE, CM.Duration, CM.Date) AS EventEndDate
    FROM Course_Meeting CM
    JOIN Courses C ON CM.Course_ID = C.Course_ID
    JOIN Employees E ON CM.Instructor_ID = E.Employee_ID

    UNION ALL

    SELECT
        E.Employee_ID AS InstructorID,
        'Studies' AS EventType,
        SD.Name AS EventName,
        SMD.Date AS EventDate,
        SMD.Duration AS EventDuration,
        DATEADD(MINUTE, SMD.Duration, SMD.Date) AS EventEndDate
    FROM Studies_Meeting_Details SMD
    JOIN Studies_Meeting SM ON SMD.Study_Meeting_ID = SM.Studies_Meeting_ID
    JOIN Studies_Details SD ON SM.Studies_ID = SD.Studies_ID
    JOIN Employees E ON SM.Translator_ID = E.Employee_ID

    UNION ALL

    SELECT
        E.Employee_ID AS InstructorID,
        'Webinar' AS EventType,
        W.Webinar_Name AS EventName,
        W.Webinar_Date AS EventDate,
        60 AS EventDuration, -- Założenie: Webinary trwają 60 minut
        DATEADD(MINUTE, 60, W.Webinar_Date) AS EventEndDate
    FROM Webinars W
    JOIN Employees E ON W.Instructor_ID = E.Employee_ID
)
SELECT
    CS1.InstructorID,
    CONCAT(E.First_Name, ' ', E.Last_Name) AS InstructorName,
    CS1.EventType AS EventType1,
    CS1.EventName AS EventName1,
    CS1.EventDate AS EventDate1,
    CS1.EventEndDate AS EventEndDate1,
    CS2.EventType AS EventType2,
    CS2.EventName AS EventName2,
    CS2.EventDate AS EventDate2,
    CS2.EventEndDate AS EventEndDate2
FROM CombinedSchedules CS1
JOIN CombinedSchedules CS2 ON CS1.InstructorID = CS2.InstructorID
    AND CS1.EventDate < CS2.EventEndDate
    AND CS1.EventEndDate > CS2.EventDate
    AND CS1.EventName <> CS2.EventName
JOIN Employees E ON CS1.InstructorID = E.Employee_ID
go

