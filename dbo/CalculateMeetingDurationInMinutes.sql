CREATE FUNCTION CalculateMeetingDurationInMinutes (@Duration TIME)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(MINUTE, '00:00:00', @Duration);
END
go

