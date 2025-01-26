CREATE PROCEDURE AddOrdersDetails
    @Details_ID INT,
    @Payment_Deadline DATETIME,
    @Currency_ID INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Walidacja wejściowych danych
        IF @Details_ID IS NULL OR @Details_ID <= 0
        BEGIN
            THROW 50000, 'Details_ID must be a positive integer.', 1;
        END

        IF @Payment_Deadline IS NULL
        BEGIN
            THROW 50001, 'Payment_Deadline cannot be NULL.', 1;
        END

        IF @Currency_ID IS NULL OR @Currency_ID <= 0
        BEGIN
            THROW 50002, 'Currency_ID must be a positive integer.', 1;
        END

        IF @Amount IS NULL OR @Amount <= 0
        BEGIN
            THROW 50003, 'Amount must be a positive value.', 1;
        END

        -- Sprawdzenie, czy Details_ID istnieje w tabeli Orders
        IF NOT EXISTS (SELECT 1 FROM Orders WHERE Orders.Order_ID = @Details_ID)
        BEGIN
            THROW 50004, 'Details_ID does not exist in the Orders table.', 1;
        END

        -- Dodanie nowego rekordu
        INSERT INTO dbo.Orders_Details (Details_ID, Payment_Deadline, Currency_ID, Amount)
        VALUES (@Details_ID, @Payment_Deadline, @Currency_ID, @Amount);

        PRINT 'Payment detail added successfully.';
    END TRY
    BEGIN CATCH
        -- Obsługa błędów
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
go

