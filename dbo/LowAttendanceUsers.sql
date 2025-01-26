CREATE VIEW LowAttendanceUsers AS
-- Użytkownicy kursów z obecnością poniżej 80%
SELECT
    U.User_ID AS UserID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    'Course' AS EventType,
    C.Name AS EventName,
    PC.Completion_Percentage AS AttendancePercentage
FROM Participant_Course PC
JOIN Courses C ON PC.Course_ID = C.Course_ID
JOIN Users U ON PC.Participant_ID = U.User_ID
WHERE PC.Completion_Percentage < 80

UNION ALL

-- Użytkownicy studiów z obecnością poniżej 80%
SELECT
    U.User_ID AS UserID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    'Studies' AS EventType,
    SD.Name AS EventName,
    (CAST(SUM(CASE WHEN SM.Attendance = 1 THEN 1 ELSE 0 END) AS FLOAT) /
     COUNT(SM.Attendance) * 100) AS AttendancePercentage
FROM Student_Meeting SM
JOIN Students S ON SM.Student_ID = S.Student_ID
JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
JOIN Studies_Details SD ON STM.Studies_ID = SD.Studies_ID
JOIN Users U ON S.Student_ID = U.User_ID
GROUP BY U.User_ID, U.First_Name, U.Last_Name, SD.Name
HAVING (CAST(SUM(CASE WHEN SM.Attendance = 1 THEN 1 ELSE 0 END) AS FLOAT) /
        COUNT(SM.Attendance) * 100) < 80
go

