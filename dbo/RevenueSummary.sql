CREATE VIEW RevenueSummary AS
SELECT
    'Webinar' AS EventType,
    W.Webinar_Name AS EventName,
    SUM(OD.Amount) AS TotalRevenue
FROM Webinars W
JOIN Webinar_Orders WO ON W.Webinar_ID = WO.Webinar_ID
JOIN Orders_Details OD ON WO.Details_ID = OD.Details_ID
GROUP BY W.Webinar_Name

UNION ALL

SELECT
    'Course' AS EventType,
    C.Name AS EventName,
    SUM(OD.Amount) AS TotalRevenue
FROM Courses C
JOIN Course_Orders CO ON C.Course_ID = CO.Course_ID
JOIN Orders_Details OD ON CO.Details_ID = OD.Details_ID
GROUP BY C.Name

UNION ALL

SELECT
    'Studies' AS EventType,
    SD.Name AS EventName, -- Pobranie nazwy studiów z tabeli Studies_Details
    SUM(OD.Amount) AS TotalRevenue
FROM Studies S
JOIN Studies_Orders SO ON S.Studies_ID = SO.Studies_ID
JOIN Orders_Details OD ON SO.Details_ID = OD.Details_ID
JOIN Studies_Details SD ON S.Studies_ID = SD.Studies_ID -- Dodanie relacji z tabelą Studies_Details
GROUP BY SD.Name
go

