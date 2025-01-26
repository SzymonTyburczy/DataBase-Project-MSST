CREATE PROCEDURE Delete_Studies_Online_Sync_Meeting
    @Studies_Meeting_ID INT
AS
BEGIN
    -- Sprawdzenie, czy spotkanie o podanym ID istnieje
    IF NOT EXISTS (SELECT 1 FROM Studies_Online_Sync_Meeting WHERE Studies_Meeting_ID = @Studies_Meeting_ID)
    BEGIN
        RAISERROR('Spotkanie o podanym Studies_Meeting_ID nie istnieje.', 16, 1);
        RETURN;
    END

    -- Usunięcie spotkania
    DELETE FROM Studies_Online_Sync_Meeting
    WHERE Studies_Meeting_ID = @Studies_Meeting_ID;

    PRINT 'Synchronizowane spotkanie zostało pomyślnie usunięte.';
END;
go

