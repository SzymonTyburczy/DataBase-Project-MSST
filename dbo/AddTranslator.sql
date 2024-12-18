CREATE PROCEDURE [dbo].[AddTranslator]
    @TranslatorID INT,
    @Language_ID nvarchar
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdź, czy TranslatorID już istnieje
    IF EXISTS (
        SELECT 1
        FROM Translator
        WHERE Translator_ID = @TranslatorID
    )
    BEGIN
        RAISERROR('Translator with this ID already exists.', 16, 1);
        RETURN;
    END;

    -- Wstaw nowego tłumacza
    BEGIN TRY
        INSERT INTO Translator (Translator_ID, Language_ID)
        VALUES (@TranslatorID, @Language_ID);

        PRINT 'Translator added successfully.';
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

