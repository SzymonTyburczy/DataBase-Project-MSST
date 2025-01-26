CREATE VIEW UserScheduleConflicts AS
WITH CombinedUserSchedules AS (
    SELECT
        U.User_ID AS UserID,
        CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
        'Course' AS EventType,
        C.Name AS EventName,
        CAST(CM.Date AS DATETIME) AS EventDate,
        CM.Duration AS EventDuration,
        DATEADD(MINUTE, CM.Duration, CAST(CM.Date AS DATETIME)) AS EventEndDate
    FROM Participant_Course PC
    JOIN Courses C ON PC.Course_ID = C.Course_ID
    JOIN Course_Meeting CM ON C.Course_ID = CM.Course_ID
    JOIN Users U ON PC.Participant_ID = U.User_ID

    UNION ALL

    SELECT
        U.User_ID AS UserID,
        CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
        'Studies' AS EventType,
        SD.Name AS EventName,
        CAST(SMD.Date AS DATETIME) AS EventDate,
        SMD.Duration AS EventDuration,
        DATEADD(MINUTE, SMD.Duration, CAST(SMD.Date AS DATETIME)) AS EventEndDate
    FROM Student_Meeting SM
    JOIN Students S ON SM.Student_ID = S.Student_ID
    JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
    JOIN Studies_Details SD ON STM.Studies_ID = SD.Studies_ID
    JOIN Users U ON S.Student_ID = U.User_ID
    JOIN Studies_Meeting_Details SMD ON STM.Studies_Meeting_ID = SMD.Study_Meeting_ID

    UNION ALL

    SELECT
        U.User_ID AS UserID,
        CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
        'Webinar' AS EventType,
        W.Webinar_Name AS EventName,
        CAST(W.Webinar_Date AS DATETIME) AS EventDate,
        60 AS EventDuration, -- Założenie: Webinary trwają 60 minut
        DATEADD(MINUTE, 60, CAST(W.Webinar_Date AS DATETIME)) AS EventEndDate
    FROM Participant_Webinar PW
    JOIN Webinars W ON PW.Webinar_ID = W.Webinar_ID
    JOIN Users U ON PW.Participant_ID = U.User_ID
)
SELECT
    CUS1.UserID,
    CUS1.UserName,
    CUS1.EventType AS EventType1,
    CUS1.EventName AS EventName1,
    CUS1.EventDate AS EventDate1,
    CUS1.EventEndDate AS EventEndDate1,
    CUS2.EventType AS EventType2,
    CUS2.EventName AS EventName2,
    CUS2.EventDate AS EventDate2,
    CUS2.EventEndDate AS EventEndDate2
FROM CombinedUserSchedules CUS1
JOIN CombinedUserSchedules CUS2 ON CUS1.UserID = CUS2.UserID
    AND CUS1.EventDate < CUS2.EventEndDate
    AND CUS1.EventEndDate > CUS2.EventDate
    AND CUS1.EventName <> CUS2.EventName
go

