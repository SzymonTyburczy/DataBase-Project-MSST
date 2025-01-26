CREATE PROCEDURE Add_Studies_Meeting
    @Studies_Meeting_ID INT,
    @Studies_ID INT,
    @Subject_ID INT,
    @Translator_ID INT = NULL,
    @Language_ID INT
AS
BEGIN
    -- Sprawdzenie, czy podane Studies_ID istnieje
    IF NOT EXISTS (SELECT 1 FROM Studies WHERE Studies_ID = @Studies_ID)
    BEGIN
        RAISERROR('Podane Studies_ID nie istnieje w tabeli Studies.', 16, 1);
        RETURN;
    END

    -- Sprawdzenie, czy podane Subject_ID istnieje
    IF NOT EXISTS (SELECT 1 FROM Subjects WHERE Subject_ID = @Subject_ID)
    BEGIN
        RAISERROR('Podane Subject_ID nie istnieje w tabeli Subjects.', 16, 1);
        RETURN;
    END

    -- Sprawdzenie, czy podane Translator_ID istnieje (jeśli nie jest NULL)
    IF @Translator_ID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Translator WHERE Translator_ID = @Translator_ID)
    BEGIN
        RAISERROR('Podane Translator_ID nie istnieje w tabeli Translators.', 16, 1);
        RETURN;
    END

    -- Dodanie nowego spotkania
    INSERT INTO Studies_Meeting (Studies_Meeting_ID, Studies_ID, Subject_ID, Translator_ID, Language_ID)
    VALUES (@Studies_Meeting_ID, @Studies_ID, @Subject_ID, @Translator_ID, @Language_ID);

    PRINT 'Nowe spotkanie zostało pomyślnie dodane.';
END;
go

