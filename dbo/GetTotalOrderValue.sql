CREATE FUNCTION GetTotalOrderValue (@OrderID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalValue MONEY;

    -- Obliczenie łącznej wartości zamówienia
    SELECT @TotalValue = SUM(OD.Amount)
    FROM Orders_Details OD
    WHERE OD.Details_ID = @OrderID;

    RETURN ISNULL(@TotalValue, 0);
END
go

