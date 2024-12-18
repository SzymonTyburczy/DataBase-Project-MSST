-- ATTENCDENCE ON EACH COURSE
CREATE FUNCTION [dbo].[GetParticipantAttendance]
(
    @ParticipantID INT,
    @CourseID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @AttendanceCount INT;

    SELECT @AttendanceCount = COUNT(*)
    FROM Participant_Meeting PM
    INNER JOIN Course_Meeting CM
        ON PM.Course_Meeting_ID = CM.Course_Meeting_ID
    WHERE PM.Participant_ID = @ParticipantID
      AND CM.Course_ID = @CourseID
      AND PM.Attendance = 1; -- Liczymy tylko obecności (Attendance = 1)

    RETURN @AttendanceCount;
END
go

