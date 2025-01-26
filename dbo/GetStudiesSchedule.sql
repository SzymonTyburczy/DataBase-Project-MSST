CREATE FUNCTION GetStudiesSchedule (@StudiesID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        SM.Studies_Meeting_ID AS MeetingID,
        SD.Name AS StudyName,
        SM.Subject_ID AS SubjectID,
        L.Language AS Language,
        SMD.Form AS MeetingForm,
        SMD.Date AS MeetingDate
    FROM Studies_Meeting SM
    JOIN Studies_Details SD ON SM.Studies_ID = SD.Studies_ID
    LEFT JOIN Language L ON SM.Language_ID = L.Language_ID
    JOIN Studies_Meeting_Details SMD ON SM.Studies_Meeting_ID = SMD.Study_Meeting_ID
    WHERE SM.Studies_ID = @StudiesID
)
go

