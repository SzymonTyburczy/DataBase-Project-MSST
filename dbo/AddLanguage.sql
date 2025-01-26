CREATE PROCEDURE AddLanguage
    @Language NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewLanguage_ID INT;
    SELECT @NewLanguage_ID = ISNULL(MAX(Language_ID), 0) + 1 FROM Language;

    INSERT INTO Language (Language_ID, Language)
    VALUES (@NewLanguage_ID, @Language);

    SELECT @NewLanguage_ID AS NewLanguageID;
END;
go

