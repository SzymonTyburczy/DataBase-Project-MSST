--PROCEDURE OF UPDATING COURSE 
CREATE PROCEDURE [dbo].[UpdateCourse]
    @CourseID INT,
    @CourseName NVARCHAR(30) = NULL,
    @CourseDescription NVARCHAR(30) = NULL,
    @CourseForm NVARCHAR(20) = NULL,
    @CoursePrice MONEY = NULL,
    @CoordinatorID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Courses WHERE Course_ID = @CourseID)
    BEGIN
        RAISERROR('Course ID does not exist.', 16, 1);
        RETURN;
    END;

    BEGIN TRY
        UPDATE Courses
        SET
            Name = ISNULL(@CourseName, Name),
            Description = ISNULL(@CourseDescription, Description),
            Form = ISNULL(@CourseForm, Form),
            Price = ISNULL(@CoursePrice, Price),
            Coordinator_ID = ISNULL(@CoordinatorID, Coordinator_ID)
        WHERE Course_ID = @CourseID;

        PRINT 'Course details updated successfully.';
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

