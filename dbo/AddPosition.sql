CREATE PROCEDURE AddPosition
    @Position_Name NVARCHAR(40),
    @Permissions NVARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewPosition_ID INT;
    SELECT @NewPosition_ID = ISNULL(MAX(Position_ID), 0) + 1 FROM Position;

    INSERT INTO Position (Position_ID, Position_Name, Permisstions)
    VALUES (@NewPosition_ID, @Position_Name, @Permissions);

    SELECT @NewPosition_ID AS NewPositionID;
END;
go

