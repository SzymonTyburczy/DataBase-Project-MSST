CREATE PROCEDURE AddOrder
    @ClientID INT,
    @OrderDate DATETIME,
    @PaymentLink NVARCHAR(MAX),
    @StudiesID INT = NULL,
    @WebinarID INT = NULL,
    @CourseID INT = NULL,
    @PaymentDeadline DATETIME,
    @CurrencyID INT,
    @Price MONEY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OrderID INT;

    -- Automatyczne wygenerowanie nowego OrderID
    SELECT @OrderID = ISNULL(MAX(Order_ID), 0) + 1 FROM Orders;

    -- Sprawdzenie, czy klient istnieje w tabeli Users
    IF NOT EXISTS (SELECT 1 FROM Users WHERE User_ID = @ClientID)
    BEGIN
        RAISERROR('Klient o podanym ID nie istnieje.', 16, 1);
        RETURN;
    END

    -- Wstawienie nowego zamówienia do tabeli Orders
    INSERT INTO Orders (Order_ID, Client_ID, Order_Date, Payment_Link)
    VALUES (@OrderID, @ClientID, @OrderDate, @PaymentLink);

    -- Dodanie szczegółów zamówienia w zależności od typu zamówienia
    IF @StudiesID IS NOT NULL
    BEGIN
        INSERT INTO Studies_Orders (Details_ID, Studies_ID)
        VALUES (@OrderID, @StudiesID);
    END
    ELSE IF @WebinarID IS NOT NULL
    BEGIN
        INSERT INTO Webinar_Orders (Details_ID, Webinar_ID)
        VALUES (@OrderID, @WebinarID);
    END
    ELSE IF @CourseID IS NOT NULL
    BEGIN
        INSERT INTO Course_Orders (Details_ID, Course_ID)
        VALUES (@OrderID, @CourseID);
    END
    ELSE
    BEGIN
        RAISERROR('Nie podano poprawnego typu zamówienia.', 16, 1);
        RETURN;
    END

    -- Dodanie szczegółów płatności
    INSERT INTO Orders_Details (Details_ID,  Payment_Deadline, Currency_ID, Amount)
    VALUES (@OrderID, @PaymentDeadline, @CurrencyID, @Price);

    PRINT 'Zamówienie dodane pomyślnie.';
END;
go

