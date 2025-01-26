CREATE VIEW EventAttendanceSummary AS
SELECT
    'Webinar' AS EventType,
    W.Webinar_Name AS EventName,
    COUNT(PW.Participant_ID) AS TotalParticipants,
    COUNT(CASE WHEN PW.Webinar_Access = 1 THEN 1 END) AS AttendedParticipants,
    CAST(COUNT(CASE WHEN PW.Webinar_Access = 1 THEN 1 END) * 100.0 / COUNT(PW.Participant_ID) AS DECIMAL(5, 2)) AS AttendancePercentage
FROM Webinars W
JOIN Participant_Webinar PW ON W.Webinar_ID = PW.Webinar_ID
GROUP BY W.Webinar_Name

UNION ALL

SELECT
    'Course' AS EventType,
    C.Name AS EventName,
    COUNT(PC.Participant_ID) AS TotalParticipants,
    COUNT(CASE WHEN PC.Completion_Percentage >= 80 THEN 1 END) AS AttendedParticipants,
    CAST(COUNT(CASE WHEN PC.Completion_Percentage >= 80 THEN 1 END) * 100.0 / COUNT(PC.Participant_ID) AS DECIMAL(5, 2)) AS AttendancePercentage
FROM Courses C
JOIN Participant_Course PC ON C.Course_ID = PC.Course_ID
GROUP BY C.Name

UNION ALL

SELECT
    'Studies' AS EventType,
    CONCAT(SD.Name, ' - ', SMD.Date) AS EventName, -- Dodanie daty spotkania do nazwy wydarzenia
    COUNT(DISTINCT SM.Student_ID) AS TotalParticipants,
    COUNT(DISTINCT CASE WHEN SM.Attendance = 1 THEN SM.Student_ID END) AS AttendedParticipants,
    CAST(COUNT(DISTINCT CASE WHEN SM.Attendance = 1 THEN SM.Student_ID END) * 100.0 / COUNT(DISTINCT SM.Student_ID) AS DECIMAL(5, 2)) AS AttendancePercentage
FROM Student_Meeting SM
JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
JOIN Studies_Meeting_Details SMD ON STM.Studies_Meeting_ID = SMD.Study_Meeting_ID
JOIN Studies_Details SD ON STM.Studies_ID = SD.Studies_ID
GROUP BY SD.Name, SMD.Date
go

