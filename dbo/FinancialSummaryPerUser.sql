CREATE VIEW FinancialSummaryPerUser AS
SELECT
    U.User_ID AS UserID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    SUM(OD.Amount) AS TotalSpent
FROM Orders O
JOIN Orders_Details OD ON O.Order_ID = OD.Details_ID
JOIN Users U ON O.Client_ID = U.User_ID
GROUP BY U.User_ID, U.First_Name, U.Last_Name
go

