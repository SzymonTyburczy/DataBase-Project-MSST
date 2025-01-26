CREATE PROCEDURE AddSubjectToStudies
    @StudiesID INT,
    @SubjectName NVARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SubjectID INT;

    BEGIN TRY
        BEGIN TRANSACTION;

        SELECT @SubjectID = ISNULL(MAX(Subject_ID), 0) + 1 FROM Subjects;


        -- Automatyczne wygenerowanie nowego SubjectID
        SELECT @SubjectID = ISNULL(MAX(Subject_ID), 0) + 1 FROM Subjects;

        -- Dodanie nowego przedmiotu
        INSERT INTO Subjects (Subject_ID, Studies_ID, Subject_Name)
        VALUES (@SubjectID, @StudiesID, @SubjectName);

        COMMIT TRANSACTION;
        PRINT 'Przedmiot został pomyślnie dodany do studiów.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Wystąpił błąd podczas dodawania przedmiotu.', 16, 1);
    END CATCH
END;
go

