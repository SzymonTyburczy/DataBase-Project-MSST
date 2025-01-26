CREATE PROCEDURE GetFinancialReport
AS
BEGIN
    SET NOCOUNT ON;

    -- Deklaracja tabeli tymczasowej do przechowywania wyników
    CREATE TABLE #FinancialReport (
        Category NVARCHAR(20),
        TotalRevenue MONEY
    );

    -- Przychody z webinarów
    INSERT INTO #FinancialReport (Category, TotalRevenue)
    SELECT 'Webinars' AS Category, SUM(OD.Amount) AS TotalRevenue
    FROM Orders_Details OD
    JOIN Webinar_Orders WO ON OD.Details_ID = WO.Details_ID;

    -- Przychody z kursów
    INSERT INTO #FinancialReport (Category, TotalRevenue)
    SELECT 'Courses' AS Category, SUM(OD.Amount) AS TotalRevenue
    FROM Orders_Details OD
    JOIN Course_Orders CO ON OD.Details_ID = CO.Details_ID;

    -- Przychody ze studiów
    INSERT INTO #FinancialReport (Category, TotalRevenue)
    SELECT 'Studies' AS Category, SUM(OD.Amount) AS TotalRevenue
    FROM Orders_Details OD
    JOIN Studies_Orders SO ON OD.Details_ID = SO.Details_ID;

    -- Zwrot wyników
    SELECT Category, ISNULL(TotalRevenue, 0) AS TotalRevenue
    FROM #FinancialReport;

    -- Czyszczenie tabeli tymczasowej
    DROP TABLE #FinancialReport;
END;
go

