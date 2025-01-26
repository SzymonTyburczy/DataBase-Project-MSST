-- Checking whether the internship student has 100% attendance every six months
CREATE PROCEDURE [dbo].[CheckStudentInternship]
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdzenie liczby praktyk odbytych raz na pół roku
    DECLARE @UniqueSemestersCount INT;

    SELECT @UniqueSemestersCount = COUNT(DISTINCT CAST(YEAR(I.Start_Date) AS VARCHAR(4)) +
                                         '-' + CAST((MONTH(I.Start_Date) - 1) / 6 + 1 AS VARCHAR(1)))
    FROM Internship I
    INNER JOIN Student_Internship SI ON I.Internship_ID = SI.Internship_ID
    WHERE SI.Student_ID = @StudentID;

    IF @UniqueSemestersCount = 0
    BEGIN
        PRINT 'Student did not complete any internships.';
        RETURN;
    END;

    -- Sprawdzenie, czy student miał 100% frekwencji na spotkaniach
    DECLARE @MissedMeetingsCount INT;
    SELECT @MissedMeetingsCount = COUNT(*)
    FROM Student_Meeting SM
    INNER JOIN Studies_Meeting STM ON SM.Study_Meeting_ID = STM.Studies_Meeting_ID
    INNER JOIN Internship I ON STM.Studies_ID = I.Studies_ID
    WHERE SM.Student_ID = @StudentID
      AND SM.Attendance = 0; -- Liczymy tylko nieobecności

    IF @MissedMeetingsCount > 0
    BEGIN
        PRINT 'Student does not have 100% attendance on internships.';
        RETURN;
    END;

    -- Wszystkie warunki zostały spełnione
    PRINT 'Student has completed internships on time with 100% attendance.';
END;
go

