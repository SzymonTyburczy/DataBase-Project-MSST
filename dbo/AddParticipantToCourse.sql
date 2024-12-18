-- ADD PARTICIPATOR TO COURSE
CREATE PROCEDURE [dbo].[AddParticipantToCourse]
    @ParticipantID INT,
    @CourseID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdzenie, czy kurs istnieje
    IF NOT EXISTS (SELECT 1 FROM Courses WHERE Course_ID = @CourseID)
    BEGIN
        RAISERROR('The course does not exist.', 16, 1);
        RETURN;
    END;

    -- Sprawdzenie, czy uczestnik już jest zapisany
    IF EXISTS (SELECT 1 FROM Participant_Course WHERE Participant_ID = @ParticipantID AND Course_ID = @CourseID)
    BEGIN
        RAISERROR('The participant is already enrolled in this course.', 16, 1);
        RETURN;
    END;

    -- Dodanie uczestnika
    BEGIN TRY
        INSERT INTO Participant_Course (Participant_ID, Course_ID, Completion_Percentage)
        VALUES (@ParticipantID, @CourseID, 0);

        PRINT 'Participant added successfully to the course.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
go

