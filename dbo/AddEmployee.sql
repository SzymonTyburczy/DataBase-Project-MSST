CREATE PROCEDURE [dbo].[AddEmployee]
    @EmployeeID INT,
    @FirstName NVARCHAR(20),
    @LastName NVARCHAR(20),
    @Position INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdź, czy EmployeeID już istnieje
    IF EXISTS (
        SELECT 1
        FROM employees
        WHERE Employee_ID = @EmployeeID
    )
    BEGIN
        RAISERROR('Employee with this ID already exists.', 16, 1);
        RETURN;
    END;

    -- Wstaw nowego pracownika
    BEGIN TRY
        INSERT INTO employees (Employee_ID, First_Name, Last_Name, Position_ID)
        VALUES (@EmployeeID, @FirstName, @LastName, @Position);

        PRINT 'Employee added successfully.';
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

