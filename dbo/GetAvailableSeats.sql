CREATE FUNCTION GetAvailableSeats(@StudiesID INT)
RETURNS INT
AS
BEGIN
    DECLARE @AvailableSeats INT;

    -- Sprawdzenie, czy podane studia istnieją
    IF NOT EXISTS (SELECT 1 FROM Studies WHERE Studies_ID = @StudiesID)
    BEGIN
        RETURN -1; -- Zwraca -1, jeśli studia nie istnieją
    END

    -- Obliczenie liczby dostępnych miejsc
    SELECT @AvailableSeats = S.Seat_Limit - ISNULL(COUNT(St.Student_ID), 0)
    FROM Studies S
    LEFT JOIN Students St ON S.Studies_ID = St.Studies_ID
    WHERE S.Studies_ID = @StudiesID
    GROUP BY S.Seat_Limit;

    RETURN @AvailableSeats;
END
go

