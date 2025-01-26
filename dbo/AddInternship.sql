CREATE PROCEDURE [dbo].[AddInternship]
    @InternshipID INT,
    @StudiesID INT,
    @StartDate DATE

AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdź, czy InternshipID już istnieje
    IF EXISTS (
        SELECT 1
        FROM Internship
        WHERE Internship_ID = @InternshipID
    )
    BEGIN
        RAISERROR('Internship with this ID already exists.', 16, 1);
        RETURN;
    END;

    -- Wstaw nowy staż
    BEGIN TRY
        INSERT INTO Internship (Internship_ID, Studies_ID, Start_Date)
        VALUES (@InternshipID, @StudiesID, @StartDate);

        PRINT 'Internship added successfully.';
    END TRY
    BEGIN CATCH
        -- Obsługa błędów
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
go

