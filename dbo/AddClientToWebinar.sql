CREATE TRIGGER AddClientToWebinar
ON Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Wstawienie uczestnika do tabeli Participant_Webinar na podstawie nowo dodanego zamówienia
    INSERT INTO Participant_Webinar (Participant_ID, Webinar_ID, Webinar_Payment, Webinar_Access)
    SELECT
        i.Client_ID,
        wo.Webinar_ID,
        1, -- Domyślnie ustawiamy, że webinar został opłacony
        0  -- Domyślnie brak dostępu do webinaru (np. do czasu aktywacji)
    FROM
        INSERTED i
    JOIN
        Webinar_Orders wo ON i.Order_ID = wo.Details_ID;

    -- Możesz dodać dodatkową logikę np. wysyłanie powiadomień lub aktualizację statusu zamówienia.
END;
go

