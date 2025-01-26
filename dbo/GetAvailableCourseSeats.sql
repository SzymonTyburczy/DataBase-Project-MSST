CREATE FUNCTION GetAvailableCourseSeats(@CourseMeetingID INT)
RETURNS INT
AS
BEGIN
    DECLARE @AvailableSeats INT;
    DECLARE @MeetingType NVARCHAR(20);

    -- Sprawdzenie typu spotkania
    SELECT @MeetingType = Form
    FROM Course_Meeting
    WHERE Course_Meeting_ID = @CourseMeetingID;


    -- Dla spotkań Sync i Async nie ma limitu miejsc
    IF @MeetingType IN ('Sync', 'Async')
    BEGIN
        RETURN NULL; -- Brak limitu miejsc
    END

    -- Obliczenie liczby dostępnych miejsc dla spotkań stacjonarnych
    SELECT @AvailableSeats = Seats_Limit - ISNULL(COUNT(PC.Participant_ID), 0)
    FROM Course_Stationary_Meeting CSM
    JOIN Course_Meeting CM ON CSM.Course_Meeting_ID = CM.Course_Meeting_ID
    LEFT JOIN Participant_Meeting PC ON CM.Course_Meeting_ID = PC.Course_Meeting_ID
    WHERE CM.Course_Meeting_ID = @CourseMeetingID
    GROUP BY CSM.Seats_Limit;

    RETURN @AvailableSeats;
END
go

