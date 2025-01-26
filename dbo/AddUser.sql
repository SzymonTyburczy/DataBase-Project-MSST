CREATE PROCEDURE [dbo].[AddUser]
    @User_ID INT,
    @First_Name NVARCHAR(30),
    @Last_Name NVARCHAR(30),
    @Account_Status NVARCHAR(10),
    @Address NVARCHAR(100),
    @Postal_Code NVARCHAR(10),
    @GDPR_Date_Consent DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdzenie, czy User_ID już istnieje
    IF EXISTS (SELECT 1 FROM Users WHERE User_ID = @User_ID)
    BEGIN
        RAISERROR('Użytkownik o podanym User_ID już istnieje.', 16, 1);
        RETURN;
    END;

    -- Wstawienie nowego użytkownika do tabeli Users
    INSERT INTO Users (User_ID, First_Name, Last_Name, Account_Status, Address, Postal_Code, GDPR_Date_Consent)
    VALUES (@User_ID, @First_Name, @Last_Name, @Account_Status, @Address, @Postal_Code, @GDPR_Date_Consent);

    PRINT 'Użytkownik został pomyślnie dodany.';
END;
go

