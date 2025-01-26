CREATE VIEW AttendanceListForCompletedEvents AS
SELECT
    'Webinar' AS EventType,
    W.Webinar_Name AS EventName,
    PW.Participant_ID AS ParticipantID,
    U.First_Name AS FirstName,
    U.Last_Name AS LastName,
    W.Webinar_Date AS EventDate,
    CASE
        WHEN PW.Webinar_Access = 1 THEN 'Present'
        ELSE 'Absent'
    END AS AttendanceStatus
FROM Webinars W
JOIN Participant_Webinar PW ON W.Webinar_ID = PW.Webinar_ID
JOIN Users U ON PW.Participant_ID = U.User_ID
WHERE W.Webinar_Date < GETDATE() -- Tylko zakończone wydarzenia

UNION ALL

SELECT
    'Course' AS EventType,
    C.Name AS EventName,
    PC.Participant_ID AS ParticipantID,
    U.First_Name AS FirstName,
    U.Last_Name AS LastName,
    CM.Date AS EventDate,
    CASE
        WHEN PC.Completion_Percentage >= 80 THEN 'Present'
        ELSE 'Absent'
    END AS AttendanceStatus
FROM Courses C
JOIN Course_Orders CO ON C.Course_ID = CO.Course_ID
JOIN Participant_Course PC ON C.Course_ID = PC.Course_ID
JOIN Users U ON PC.Participant_ID = U.User_ID
JOIN Course_Meeting CM ON C.Course_ID = CM.Course_ID
WHERE CM.Date < GETDATE() -- Tylko zakończone wydarzenia

UNION ALL

SELECT
    'Studies' AS EventType,
    SD.Name AS EventName,
    SM.Student_ID AS ParticipantID,
    U.First_Name AS FirstName,
    U.Last_Name AS LastName,
    SM.Meeting_Date AS EventDate,
    CASE
        WHEN SM.Attendance = 1 THEN 'Present'
        ELSE 'Absent'
    END AS AttendanceStatus
FROM Student_Meeting SM
JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
JOIN Studies S ON STM.Studies_ID = S.Studies_ID
JOIN Students ST ON SM.Student_ID = ST.Student_ID
JOIN Users U ON ST.Student_ID = U.User_ID
JOIN Studies_Details SD ON S.Studies_ID = SD.Studies_ID
WHERE SM.Meeting_Date < GETDATE()
go

