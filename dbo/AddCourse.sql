CREATE PROCEDURE [dbo].[AddCourse]
    @CourseID INT,
    @CourseName NVARCHAR(30),
    @CourseDescription NVARCHAR(30),
    @CourseForm NVARCHAR(20),
    @CoursePrice MONEY,
    @CoordinatorID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdzenie, czy istnieje koordynator kursu
    IF NOT EXISTS (
        SELECT 1
        FROM Employees
        WHERE Employee_ID = @CoordinatorID
          AND Position_ID IN (SELECT Position_ID FROM Position WHERE Position_Name = 'Course Coordinator')
    )
    BEGIN
        RAISERROR('Invalid Coordinator ID. The coordinator does not exist or is not authorized.', 16, 1);
        RETURN;
    END;

    -- Sprawdzenie, czy kurs o podanym ID już istnieje
    IF EXISTS (
        SELECT 1
        FROM Courses
        WHERE Course_ID = @CourseID
    )
    BEGIN
        RAISERROR('A course with this Course ID already exists.', 16, 1);
        RETURN;
    END;

    -- Dodanie nowego kursu
    BEGIN TRY
        INSERT INTO Courses (Course_ID, Name, Description, Form, Price, Coordinator_ID)
        VALUES (@CourseID, @CourseName, @CourseDescription, @CourseForm, @CoursePrice, @CoordinatorID);

        PRINT 'The course was successfully added.';
    END TRY
    BEGIN CATCH
        -- Obsługa błędów
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
go

