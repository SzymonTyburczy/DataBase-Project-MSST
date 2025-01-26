CREATE PROCEDURE DeleteInternship
    @Internship_ID INT
AS
BEGIN
    -- Sprawdzenie, czy Internship_ID istnieje w tabeli Internships
    IF NOT EXISTS (SELECT 1 FROM Internship WHERE Internship_ID = @Internship_ID)
    BEGIN
        RAISERROR('Podane Internship_ID nie istnieje w tabeli Internships.', 16, 1);
        RETURN;
    END

    -- Usunięcie praktyki
    DELETE FROM Internship
    WHERE Internship_ID = @Internship_ID;

    PRINT 'Praktyka została pomyślnie usunięta.';
END;
go

