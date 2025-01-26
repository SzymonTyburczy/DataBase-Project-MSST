CREATE PROCEDURE AddStudent
    @Student_ID INT,
    @Studies_ID INT
AS
BEGIN
    -- Sprawdzenie, czy podane Studies_ID istnieje w tabeli Studies
    IF NOT EXISTS (SELECT 1 FROM Studies WHERE Studies_ID = @Studies_ID)
    BEGIN
        RAISERROR('Podane Studies_ID nie istnieje w tabeli Studies.', 16, 1);
        RETURN;
    END

    -- Sprawdzenie, czy już istnieje wpis z tym samym Student_ID i Studies_ID
    IF EXISTS (SELECT 1 FROM Students WHERE Student_ID = @Student_ID AND Studies_ID = @Studies_ID)
    BEGIN
        RAISERROR('Student jest już przypisany do tych studiów.', 16, 1);
        RETURN;
    END

    -- Dodanie nowego wpisu
    INSERT INTO Students (Student_ID, Studies_ID)
    VALUES (@Student_ID, @Studies_ID);

    PRINT 'Student został pomyślnie dodany do studiów.';
END;
go

