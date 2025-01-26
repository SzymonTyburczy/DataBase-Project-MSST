CREATE TRIGGER AddClientToStudies
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

    -- Dodanie klienta do tabeli Students, jeśli jeszcze go tam nie ma
    INSERT INTO Students (Student_ID, Studies_ID)
    SELECT
        i.Client_ID,
        sd.Studies_ID
    FROM inserted i
    JOIN Orders_Details od ON i.Order_ID = od.Details_ID
    JOIN Studies_Orders so ON od.Details_ID = so.Details_ID
    JOIN Studies sd ON so.Studies_ID = sd.Studies_ID
    WHERE NOT EXISTS (
        SELECT 1 FROM Students s WHERE s.Student_ID = i.Client_ID AND s.Studies_ID = sd.Studies_ID
    );

    -- Przypisanie klienta do spotkań studyjnych
    INSERT INTO Student_Meeting (Student_ID, Study_Meeting_ID, Attendance, Meeting_Date)
    SELECT
        i.Client_ID,
        sm.Studies_Meeting_ID,
        0, -- Domyślnie brak obecności
        smd.Date
    FROM inserted i
    JOIN Orders_Details od ON i.Order_ID = od.Details_ID
    JOIN Studies_Orders so ON od.Details_ID = so.Details_ID
    JOIN Studies sd ON so.Studies_ID = sd.Studies_ID
    JOIN Studies_Meeting sm ON sd.Studies_ID = sm.Studies_ID
    JOIN Studies_Meeting_Details smd ON sm.Studies_Meeting_ID = smd.Study_Meeting_ID
    WHERE NOT EXISTS (
        SELECT 1
        FROM Student_Meeting stm
        WHERE stm.Student_ID = i.Client_ID AND stm.Study_Meeting_ID = sm.Studies_Meeting_ID
    );

END;
go

