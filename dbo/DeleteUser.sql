CREATE PROCEDURE DeleteUser
    @User_ID INT
AS
BEGIN
    -- Sprawdzenie, czy użytkownik o podanym User_ID istnieje
    IF NOT EXISTS (SELECT 1 FROM Users WHERE User_ID = @User_ID)
    BEGIN
        RAISERROR('Użytkownik o podanym User_ID nie istnieje.', 16, 1);
        RETURN;
    END

    -- Usunięcie użytkownika z tabeli
    DELETE FROM Users
    WHERE User_ID = @User_ID;

    PRINT 'Użytkownik został pomyślnie usunięty.';
END;
go

