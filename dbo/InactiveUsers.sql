CREATE VIEW InactiveUsers AS
SELECT
    U.User_ID AS UserID,
    CONCAT(U.First_Name, ' ', U.Last_Name) AS UserName,
    U.Account_Status AS AccountStatus
FROM Users U
WHERE U.User_ID NOT IN (
    SELECT DISTINCT Participant_ID FROM Participant_Webinar WHERE Webinar_ID IN (
        SELECT Webinar_ID FROM Webinars WHERE Webinar_Date >= DATEADD(MONTH, -6, GETDATE())
    )
    UNION
    SELECT DISTINCT Participant_ID FROM Participant_Course WHERE Course_ID IN (
        SELECT Course_ID FROM Course_Meeting WHERE Date >= DATEADD(MONTH, -6, GETDATE())
    )
    UNION
    SELECT DISTINCT Student_ID FROM Student_Meeting WHERE Study_Meeting_ID IN (
        SELECT Study_Meeting_ID FROM Studies_Meeting_Details WHERE Date >= DATEADD(MONTH, -6, GETDATE())
    )
)
go

