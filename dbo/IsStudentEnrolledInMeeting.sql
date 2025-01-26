CREATE FUNCTION IsStudentEnrolledInMeeting (@StudentID INT, @MeetingID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsEnrolled BIT;

    -- Sprawdzenie, czy student jest przypisany do konkretnego spotkania
    IF EXISTS (
        SELECT 1
        FROM Students S
        JOIN Studies_Meeting SM ON S.Studies_ID = SM.Studies_ID
        WHERE S.Student_ID = @StudentID
          AND SM.Studies_Meeting_ID = @MeetingID
    )
    BEGIN
        SET @IsEnrolled = 1; -- Student jest zapisany na to spotkanie
    END
    ELSE
    BEGIN
        SET @IsEnrolled = 0; -- Student nie jest zapisany na to spotkanie
    END

    RETURN @IsEnrolled;
END
go

