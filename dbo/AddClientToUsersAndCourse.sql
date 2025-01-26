CREATE TRIGGER AddClientToUsersAndStudents
ON Orders
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Dodanie klienta do tabeli Users, jeśli jeszcze go tam nie ma
    INSERT INTO Users (User_ID, First_Name, Last_Name, Account_Status, Address, Postal_Code, GDPR_Date_Consent)
    SELECT
        i.Client_ID,
        'Unknown', -- Podstawowe dane, do uzupełnienia później
        'Unknown',
        'Active',
        'Unknown Address',
        '00000',
        GETDATE()
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 FROM Users u WHERE u.User_ID = i.Client_ID
    );

 -- Przypisanie klienta do kursu
    INSERT INTO Participant_Course (Participant_ID, Course_ID, Completion_Percentage)
    SELECT
        i.Client_ID, -- Zmieniono na User_ID
        co.Course_ID,
        0 AS Completion_Percentage
    FROM
        inserted i
    JOIN
        Course_Orders co ON i.Order_ID = co.Details_ID; -- Order_ID pozostaje bez zmian, jeśli istnieje

    -- Przypisanie klienta do spotkań kursu
    INSERT INTO Participant_Meeting (Participant_ID, Course_Meeting_ID, Attendance)
    SELECT
        i.Client_ID, -- Zmieniono na User_ID
        cm.Course_Meeting_ID,
        0 AS Attendance
    FROM
        inserted i
    JOIN
        Course_Orders co ON i.Order_ID = co.Details_ID
    JOIN
        Course_Meeting cm ON co.Course_ID = cm.Course_ID
    WHERE
        NOT EXISTS (
            SELECT 1
            FROM Participant_Meeting pm
            WHERE pm.Participant_ID = i.Client_ID AND pm.Course_Meeting_ID = cm.Course_Meeting_ID
        );
END;
go

