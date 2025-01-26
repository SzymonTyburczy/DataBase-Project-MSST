CREATE FUNCTION CalculateAttendancePercentage
(
    @Student_ID INT,
    @Subject_ID INT
)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @TotalMeetings INT;
    DECLARE @AttendedMeetings INT;
    DECLARE @AttendancePercentage DECIMAL(5, 2);

    SELECT @TotalMeetings = COUNT(*)
    FROM Studies_Meeting
    WHERE Subject_ID = @Subject_ID;

    SELECT @AttendedMeetings = COUNT(*)
    FROM Student_Meeting SM
    INNER JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
    WHERE SM.Student_ID = @Student_ID AND STM.Subject_ID = @Subject_ID AND SM.Attendance = 1;

    IF @TotalMeetings > 0
        SET @AttendancePercentage = CAST(@AttendedMeetings AS DECIMAL(5, 2)) / CAST(@TotalMeetings AS DECIMAL(5, 2)) * 100;
    ELSE
        SET @AttendancePercentage = 0;

    RETURN @AttendancePercentage;
END
go

