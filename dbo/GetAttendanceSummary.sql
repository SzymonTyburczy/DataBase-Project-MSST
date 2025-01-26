CREATE PROCEDURE GetAttendanceSummary
AS
BEGIN
    SET NOCOUNT ON;

    -- Tymczasowa tabela do przechowywania wyników
    CREATE TABLE #AttendanceSummary (
        EventType NVARCHAR(20),
        EventName NVARCHAR(80),
        TotalParticipants INT,
        AttendedParticipants INT,
        AttendancePercentage DECIMAL(5, 2)
    );

    -- Frekwencja na webinarach
    INSERT INTO #AttendanceSummary (EventType, EventName, TotalParticipants, AttendedParticipants, AttendancePercentage)
    SELECT
        'Webinar' AS EventType,
        W.Webinar_Name AS EventName,
        COUNT(PW.Participant_ID) AS TotalParticipants,
        COUNT(CASE WHEN PW.Webinar_Access = 1 THEN 1 END) AS AttendedParticipants,
        CAST((100.0 * COUNT(CASE WHEN PW.Webinar_Access = 1 THEN 1 END) / NULLIF(COUNT(PW.Participant_ID), 0)) AS DECIMAL(5, 2)) AS AttendancePercentage
    FROM Webinars W
    LEFT JOIN Participant_Webinar PW ON W.Webinar_ID = PW.Webinar_ID
    GROUP BY W.Webinar_Name;

    -- Frekwencja na kursach
    INSERT INTO #AttendanceSummary (EventType, EventName, TotalParticipants, AttendedParticipants, AttendancePercentage)
    SELECT
        'Course' AS EventType,
        C.Name AS EventName,
        COUNT(PC.Participant_ID) AS TotalParticipants,
        COUNT(CASE WHEN PC.Completion_Percentage >= 80 THEN 1 END) AS AttendedParticipants,
        CAST((100.0 * COUNT(CASE WHEN PC.Completion_Percentage >= 80 THEN 1 END) / NULLIF(COUNT(PC.Participant_ID), 0)) AS DECIMAL(5, 2)) AS AttendancePercentage
    FROM Courses C
    LEFT JOIN Participant_Course PC ON C.Course_ID = PC.Course_ID
    GROUP BY C.Name;

    -- Frekwencja na studiach
    INSERT INTO #AttendanceSummary (EventType, EventName, TotalParticipants, AttendedParticipants, AttendancePercentage)
    SELECT
        'Studies' AS EventType,
        CAST(SM.Study_Meeting_ID AS NVARCHAR(80)) AS EventName,
        COUNT(SM.Student_ID) AS TotalParticipants,
        COUNT(CASE WHEN SM.Attendance = 1 THEN 1 END) AS AttendedParticipants,
        CAST((100.0 * COUNT(CASE WHEN SM.Attendance = 1 THEN 1 END) / NULLIF(COUNT(SM.Student_ID), 0)) AS DECIMAL(5, 2)) AS AttendancePercentage
    FROM Student_Meeting SM
    JOIN Studies_Meeting SDM ON SM.Study_Meeting_ID = SDM.Studies_Meeting_ID
    GROUP BY SM.Study_Meeting_ID;

    -- Zwrot wyników
    SELECT * 
    FROM #AttendanceSummary;

    -- Usunięcie tabeli tymczasowej
    DROP TABLE #AttendanceSummary;
END;
go

