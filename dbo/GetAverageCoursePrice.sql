-- AVERAGE COURSE PRICE
CREATE FUNCTION [dbo].[GetAverageCoursePrice]()
RETURNS MONEY
AS
BEGIN
    DECLARE @AveragePrice MONEY;

    SELECT @AveragePrice = AVG(Price) FROM Courses;

    RETURN @AveragePrice;
END
go

