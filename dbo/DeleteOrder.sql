CREATE PROCEDURE DeleteOrder
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sprawdzenie, czy zamówienie istnieje
    IF NOT EXISTS (SELECT 1 FROM Orders WHERE Order_ID = @OrderID)
    BEGIN
        RAISERROR('Zamówienie o podanym ID nie istnieje.', 16, 1);
        RETURN;
    END

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Usunięcie powiązanych rekordów z tabeli Studies_Orders
        DELETE FROM Studies_Orders WHERE Details_ID = @OrderID;

        -- Usunięcie powiązanych rekordów z tabeli Webinar_Orders
        DELETE FROM Webinar_Orders WHERE Details_ID = @OrderID;

        -- Usunięcie powiązanych rekordów z tabeli Course_Orders
        DELETE FROM Course_Orders WHERE Details_ID = @OrderID;

        -- Usunięcie szczegółów płatności
        DELETE FROM Orders_Details WHERE Details_ID = @OrderID;

        -- Usunięcie zamówienia
        DELETE FROM Orders WHERE Order_ID = @OrderID;

        COMMIT TRANSACTION;
        PRINT 'Zamówienie zostało pomyślnie usunięte.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Wystąpił błąd podczas usuwania zamówienia.', 16, 1);
    END CATCH
END;
go

