CREATE VIEW UserPostalData AS
SELECT
    User_ID AS UserID,
    CONCAT(First_Name, ' ', Last_Name) AS FullName,
    Address,
    Postal_Code AS PostalCode
FROM
    Users
go

