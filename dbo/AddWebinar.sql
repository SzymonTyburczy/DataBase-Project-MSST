CREATE PROCEDURE [dbo].[AddWebinar]
    @WebinarID INT,
    @InstructorID INT,
    @TranslatorID INT,
    @Title NVARCHAR(100),
    @Date DATE,
    @LanguegeID INT

AS
BEGIN
    SET NOCOUNT ON;

    -- Check if WebinarID already exists
    IF EXISTS (
        SELECT 1
        FROM Webinars
        WHERE Webinar_ID = @WebinarID
          AND Webinars.Instructor_ID IN (SELECT Position_ID FROM Position WHERE Position_Name = 'Instructor')
    )
    BEGIN
        RAISERROR('Webinar with this ID already exists.', 16, 1);
        RETURN;
    END;

    -- Insert new webinar
    BEGIN TRY
        INSERT INTO Webinars (Webinar_ID, Instructor_ID, Translator_ID, Webinar_Name, Webinar_Date, Language_ID)
        VALUES (@WebinarID, @InstructorID, @TranslatorID, @Title, @Date, @LanguegeID);

        PRINT 'Webinar added successfully.';
    END TRY
    BEGIN CATCH
        -- Error handling
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
go

