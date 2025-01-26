CREATE PROCEDURE Add_Studies_Online_Async_Meeting
    @Studies_Meeting_ID INT,
    @Link_To_Meeting NVARCHAR(255)
AS
BEGIN
    -- Sprawdzenie, czy spotkanie o podanym ID już istnieje
    IF EXISTS (SELECT 1 FROM Studies_Online_Async_Meeting WHERE Studies_Meeting_ID = @Studies_Meeting_ID)
    BEGIN
        RAISERROR('Spotkanie o podanym Studies_Meeting_ID już istnieje.', 16, 1);
        RETURN;
    END

    -- Dodanie nowego spotkania
    INSERT INTO Studies_Online_Async_Meeting (Studies_Meeting_ID, Link_To_Meeting)
    VALUES (@Studies_Meeting_ID, @Link_To_Meeting);

    PRINT 'Nowe spotkanie online zostało pomyślnie dodane.';
END;
go

