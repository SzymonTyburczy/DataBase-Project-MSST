CREATE PROCEDURE AddStudies
    @Name NVARCHAR(40),
    @Description NVARCHAR(MAX),
    @Syllabus NVARCHAR(MAX),
    @NumberOfSemesters INT,
    @Fee MONEY,
    @SeatLimit INT,
    @CoordinatorID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StudiesID INT;

    -- Sprawdzenie, czy koordynator istnieje w tabeli Employees
    IF NOT EXISTS (SELECT 1 FROM Employees WHERE Employee_ID = @CoordinatorID)
    BEGIN
        RAISERROR('Koordynator o podanym ID nie istnieje.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Automatyczne wygenerowanie nowego StudiesID
        SELECT @StudiesID = ISNULL(MAX(Studies_ID), 0) + 1 FROM Studies;

        -- Wstawienie nowego wpisu do tabeli Studies
        INSERT INTO Studies (Studies_ID,Number_Of_Semesters, Fee, Seat_Limit)
        VALUES (@StudiesID,@NumberOfSemesters, @Fee, @SeatLimit);


        -- Wstawienie szczegółów studiów
        INSERT INTO Studies_Details (Studies_ID, Name, Description, Syllabus, Coordinator_ID)
        VALUES (@StudiesID, @Name, @Description, @Syllabus, @CoordinatorID);

        COMMIT TRANSACTION;
        PRINT 'Studia zostały pomyślnie dodane.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Wystąpił błąd podczas dodawania studiów.', 16, 1);
    END CATCH
END;
go

